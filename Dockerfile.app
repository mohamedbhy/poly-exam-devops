FROM node:18-alpine as base
RUN mkdir -p /opt/app
WORKDIR /opt/app
COPY . /opt/app
RUN npm install --verbose
RUN npm run build
EXPOSE 8080
CMD [ "npm","run","start:client" ]