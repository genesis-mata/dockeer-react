FROM node:alpine as builder

WORKDIR '/usr/apps/node-app'

COPY ./package.json .
RUN npm install

COPY . .

RUN npm run build

FROM nginx

COPY --from=builder '/usr/apps/node-app/build' '/usr/share/nginx/html'