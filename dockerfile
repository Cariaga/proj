#this is the docker file for dockerizing nodejs
FROM node:10
ENV Npm_CONFIG_LOGLEVEL warn
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev libkrb5-dev

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install --only=production

# Bundle app source
COPY . /usr/src/app

EXPOSE 8080