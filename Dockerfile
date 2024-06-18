# First stage: build
FROM node:14-alpine as build

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# Second stage: Hosting with nginx
FROM nginx:stable-alpine

# Copy content from build stage from /app/build path into nginx specific path
COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]



