FROM node:latest

RUN mkdir -p /var/www
WORKDIR /var/www

ENV NODE_PATH=/usr/local/lib/node_modules/:/usr/local/lib NODE_ENV=production

COPY package.json /var/www
RUN npm install
RUN curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

COPY dist /var/www

EXPOSE 8080
CMD [ "npm", "start" ]
