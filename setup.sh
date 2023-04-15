#!/bin/bash

# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
  echo "removing dev kind-gpt cluster"
  ctlptl delete cluster kind-gpt
  kubectl config use-context $context
  docker stop ctlptl-registry
  echo "Removing Docker built images"
  read -r -p "would you like to remove all docker images built present on the system? [Yy/Nn]" answer < /dev/tty
  case $answer in
    [Yy]* ) docker system prune -a -f && docker volume prune -f
            ;;
    * ) ;;
  esac
  for n in $(docker buildx ls | awk '{print $1}' | grep -v 0 | tail -n +2)
  do
    docker buildx rm $n
  done
}

context=$(kubectl config current-context)

cat <<EOF | ctlptl apply -f -
apiVersion: ctlptl.dev/v1alpha1
kind: Cluster
product: kind
registry: ctlptl-registry
name: kind-gpt
kindV1Alpha4Cluster:
  name: my-cluster
  nodes:
  - role: control-plane
    kubeadmConfigPatches:
    - |
      kind: InitConfiguration
      nodeRegistration:
        kubeletExtraArgs:
          node-labels: "ingress-ready=true"
    extraPortMappings:
    - containerPort: 80
      hostPort: 80
      protocol: TCP
    - containerPort: 443
      hostPort: 443
      protocol: TCP
    extraMounts:
      - hostPath: '$PWD'
        containerPath: /mnt
---
apiVersion: ctlptl.dev/v1alpha1
kind: Registry
port: 5000
listenAddress: localhost
EOF

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

kubectl wait --for=condition=available --all deployments -n ingress-nginx
kubectl wait --for=condition=complete --all jobs -n ingress-nginx

tilt up