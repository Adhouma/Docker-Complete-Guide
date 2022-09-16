# Use node version 16.17.0 as a base image for this custom image
FROM node:16.17.0

# Set node-app as the working directory inside our custom image
WORKDIR /node-app

# Copy package.json into this custom image file system under /node-app
COPY package.json /node-app

# Run the npm install command inside our custom image inside our working directory (/node-app)
RUN npm install

# Copy everthing in our project into this custom image file system under /node-app
COPY . /node-app

# Expose port 80 in our custom image
EXPOSE 80

# Run node server.js command when starting a new container
# CMD command should be ALWAYS the last command
CMD [ "node", "server.js" ]

################################

# Use this custom image ?

# Build a custom image based on this Dockerfile instruction with this command:
# docker build .

# Run a new container based on this custom image
# Bind port 3000 for our machine to port 80 exposed in the container
# docker run -p 3000:80 [image-name]
