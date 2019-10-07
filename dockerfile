#this is the docker file for dockerizing nodejs
FROM node:10
ENV Npm_CONFIG_LOGLEVEL warn
RUN  mkdir -p /usr/src/app
EXPOSE 8080
WORKDIR /usr/src/app

ADD package.json /usr/src/app/

RUN npm install --production

ADD . /usr/src/app/

ENTRYPOINT ["npm", "start"]
