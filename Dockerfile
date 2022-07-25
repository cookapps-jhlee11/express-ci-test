FROM node:16-alpine

WORKDIR /app

COPY package.json ./

RUN npm install .
RUN npm install -g nodemon

COPY ./ ./

CMD ["nodemon", "index.js"]

EXPOSE 3000

