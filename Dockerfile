FROM node:8-alpine

WORKDIR /usr/app

RUN cp package.json .

RUN npm i --quiet

RUN cp . .

RUN npm install pm2 -g

CMD ["pm2-runtime", "index.js"]
