# syntax=docker/dockerfile:1

FROM node:14.17.3

ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json","package-lock.json", "./"]

RUN npm install --production

RUN npm run build

RUN npm run generate

FROM nginx:alpine

COPY --from=dist /app/dist /usr/share/nginx/html