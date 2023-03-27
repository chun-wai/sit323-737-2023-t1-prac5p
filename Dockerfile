# Using nginx base image and perform healthcheck
FROM nginx:latest

HEALTHCHECK --interval=35s --timeout=4s CMD curl -f https://localhost/ || exit 1

FROM node:16

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

RUN npm install

# Bundle app source
COPY server.js .

EXPOSE 8080
CMD [ "node", "server.js" ]
