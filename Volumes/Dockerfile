FROM node:14

# Use Arg to difine variables inside Dockerfile
ARG DEFAULT_PORT=80

WORKDIR /node-app

COPY package.json /node-app

RUN yarn install

COPY . /node-app

# Use ENV to define environment variables at runtime
# We can use this environment variable in the server.js file => `app.listen(process.env.PORT);`

# We can define environment variables with the docker run command
# Example:
# docker run -d -p 3000:80 --rm --env PORT=80 -v feedback-volume:/node-app/feedback volumes

# Or we can define environment variables inside .env file in the root folder then use it in the docker run command
# Example:
# docker run -d -p 3000:80 --rm --env-file ./.env -v feedback-volume:/node-app/feedback volumes
ENV PORT=${DEFAULT_PORT}

EXPOSE ${PORT}

CMD [ "node", "server.js" ]

################################

# Use this custom image ?

# Build a custom image based on this Dockerfile instruction with this command:
# docker build --tag volumes .

# Run a new container based on this custom image
# Bind port 3000 for our machine to port 80 exposed in the container and use volumes
# docker run -d -p 3000:80 --rm --env PORT=80 -v feedback-volume:/node-app/feedback volumes
# feedback-volume is the name of the volume (You canspecify whatever name you want)
# feedback-volume is a named volume (Named volumes survive when container is stopped unlike Anonymos volumes)

# -v feedback-volume:/node-app/feedback => Use named volume (feedback-volume) in our machine 
# and store it under our container under node-app/feedback folder
# node-app (WORKDIR)

# If we stop or remove our container we have to use the same volume to retreive our data or it will be lost
# docker run -d -p 3000:80 --rm --env PORT=80 -v feedback-volume:/node-app/feedback volumes
