# jupx
A Ubuntu image with Python3, JDK21 and XeLaTeX pre-installed. It is used for conducting experiment.

## Buid a docker image
```
docker build -t hdjay2013/ubuntu2404 .
```
## Run a container
```
docker run -d -p 2222:22 -v ubuntu:/root --name ubuntu hdjay2013/ubuntu2404 sleep infinity
```
## Start ssh service
``` 
docker exec -it ubuntu /bin/bash
service ssh start
```
## Login with SSH
```
ssh root@localhost -p 2222
```
