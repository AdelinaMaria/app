FROM node:latest

RUN mkdir -p /var/www
WORKDIR /var/www

ENV NODE_PATH=/usr/local/lib/node_modules/:/usr/local/lib NODE_ENV=production

COPY dist/package.json /var/www
RUN npm install
RUN apk update
RUN apk upgrade
RUN apk add python python-dev py-pip build-base curl
RUN curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
RUN pip install docker-compose

COPY dist /var/www

EXPOSE 8080
CMD [ "npm", "start" ]
