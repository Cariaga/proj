#this is the docker file for dockerizing nodejs
FROM node:9-slim
WORKDIR /
COPY package.json ./app
RUN npm install
CMD ["npm","start"]
