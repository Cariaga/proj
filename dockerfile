#this is the docker file for dockerizing nodejs
FROM node:9-slim
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
EXPOSE 8080
CMD ["npm","start"]
