FROM node:18-alpine

RUN mkdir -p /home/node/app/node_modules

WORKDIR /home/node/app

COPY package*.json ./

RUN chown -R node:node /home/node/app

RUN npm install -g serve

USER node

RUN npm install

COPY --chown=node:node . .

RUN npm run build

EXPOSE 3000

CMD [ "serve", "-s", "build" ]