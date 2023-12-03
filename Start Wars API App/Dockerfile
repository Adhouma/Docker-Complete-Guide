FROM node

WORKDIR /app

COPY package.json /app/

RUN yarn install

COPY . /app/

CMD [ "node", "app.js" ]

# See documentation in the app.js file