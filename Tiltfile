# Loading Extentions
load('ext://helm_resource', 'helm_resource', 'helm_repo')
load('module','build','cert_manager')
namespace="default"

build('gpt')
cert_manager('local-dev.duckdns.org',namespace=namespace)

helm_resource(
  'openaccessgpt',
  'openaccessgpt',
  labels="frontend",
  flags=[
    '--set', 'pdb.minAvailable=1',
    '--set', 'ingress.enabled=true',
    '--set', 'ingress.hosts[0].host=local-dev.duckdns.org',
    '--set', 'ingress.hosts[0].paths[0].path=/',
    '--set', 'ingress.hosts[0].paths[0].pathType=Prefix',
    '--set', 'ingress.tls[0].certificate=certificate',
    '--set', 'ingress.tls[0].hosts[0]=local-dev.duckdns.org',
    '--debug',
  ],
  image_deps=['gpt'],
  image_keys=[('image.repository', 'image.tag')],
)
