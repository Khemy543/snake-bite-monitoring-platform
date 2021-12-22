# syntax=docker/dockerfile:1

FROM node:14.17.3

ENV NODE_ENV=production

WORKDIR /app

COPY . /app/

RUN npm install --production

RUN npm run build

EXPOSE 5000

ENV NUXT_HOST=0.0.0.0

ENV NUXT_PORT=5000

CMD ["npm", "start"]