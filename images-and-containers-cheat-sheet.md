# Images useful commands

#### Build a Dockerfile and create your own Image based on the file
* docker build
  ```console
    $ docker build .
  ```

  Assign a NAME and a TAG to an image
  ```console
    $ -t [name:tag]
  ```

#### Create and start a new container based on image IMAGE_NAME (or use the image id)
* docker run
  ```console
    $ docker run [image_name]
  ```

  Assign a NAME to the container. The name can be used for stopping and removing etc.
    ```console
      $ --name [name]
    ```
  Run the container in detached mode - i.e. output printed by the container is not visible, the command prompt / terminal does NOT wait for the container to stop
    ```console
      $ -d
    ```

  Run the container in "interactive" mode - the container / application is then prepared to receive input via the command prompt / terminal. You can stop the container with CTRL + C when using the -it flag
    ```console
      $ -it
    ```

  Automatically remove the container when it's stopped
    ```console
      $ --rm
    ```

#### List all locally stored images
  ```console
    $ docker images
  ```

#### Remove an image by name or id 
  ```console
    $ docker rmi [image_id]
  ```

####  Remove all dangling images (untagged images)
* docker image prun
  ```console
    $ docker image prun
  ```

  Remove all locally stored images
  ```console
    $ -a
  ```

#### Push an image to DockerHub (or another registry) - the image name/tag must include the repository name/ url
```console
  $ docker push [image_id]
```

#### Pull (download) an image from DockerHub (or another registry) - this is done automatically if you just docker run IMAGE and the image wasn't pulled before
```console
  $ docker pull [image_name]
```

#### Inspect images
```console
  $ docker image inspect [image_id]
```

#### Rename images
```console
  $ docker tag [old_name:tag] [new_name:tag]
```


# Containers useful commands

#### List all running containers
* docker ps
    ```console
      $ docker ps
    ```

  List all containers - including stopped ones
    ```console
      $ -a
    ```

#### Remove a container with name CONTAINER (you can also use the container id)
  ```console
    $ docker rm [container_id]
  ```

#### Remove all stopped containers
  ```console
    $ docker container prune
  ``` 

#### Copy files into containers
  ```console
    $ docker cp [source-path] [running-container-id]:/[destination-path]
  ```
  > Example: `$ docker cp dummy/dummy.txt 38ceafe4cc7c:/dummy`

#### Copy files from containers
  ```console
    $ docker cp [running-container-id]:/[source-path] [destinqtion-path]
  ```
  > Example: `$ docker cp 38ceafe4cc7c:/dummy/. dummy/`
