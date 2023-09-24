## Run

- TO run this project you digit:
`./gradlew bootRun`

## Publish docker image to dockerhub

- First, build de jar file:
`./gradlew clean build`

- After that, build de Dockerfile
`docker build -t arquitetura-software .`

- After, tag the docker image:
  `docker tag arquitetura-software hiarlyfs/arquitetura-software`

- Push the image to the dockerhub
`docker push hiarlyfs/arquitetura-software`