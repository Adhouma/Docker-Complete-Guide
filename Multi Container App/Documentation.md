## Docker Network
# Create a shared docker network so the backend and mongodb communicate in the same netwrok
docker network create goals_network

## MongDB container
# Create a mongodb container and use the goals_network with a named volume (goals_data)
# /data/db is the underlying host system inside the container (See https://hub.docker.com/_/mongo) for more details
# Use authentication with MONGO_INITDB_ROOT_USERNAME and MONGO_INITDB_ROOT_PASSWORD See (https://hub.docker.com/_/mongo) for more details
docker run 
  -d 
  --rm 
  --name mongdb_app 
  --network goals_network 
  -v goals_data:/data/db 
  -e MONGO_INITDB_ROOT_USERNAME=abdeladhim
  -e MONGO_INITDB_ROOT_PASSWORD=goals_password
  mongo

## Backend container
# Use mongdb_app container instead of localhost 
# Change (in app.js) from 'mongodb://localhost:27017/course-goals' to 'mongodb://mongodb_app:27017/course-goals'
# Run a container goals_backend_app based on goals_backend_image on port 80
docker build --tag goals_backend_image .
docker run --name goals_backend_app -d --rm -p 80:80  --network goals_network goals_backend_image

## Frontend container
# Run a container goals_frontend_app based on goals_frontend_image on port 3000
docker build --tag goals_frontend_image .
docker run --name goals_frontend_app --rm --it -p 3000:3000 goals_frontend_image