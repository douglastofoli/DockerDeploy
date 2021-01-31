FROM node:lts

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install 
#&& npm run tsc

COPY . .

EXPOSE 3000

CMD [ "node", "dist/index.js" ]