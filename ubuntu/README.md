##### Ubuntu:14.04 image for docker:

```shell
cd ubuntu-git/
docker build -t name-of-image:tag-of-image .
docker run -t -i -p 8080:8080 name-of-image:tag-of-image
docker rename old-name new-name
```
___

##### Cookies:

```shell
docker attach name-of-container
docker start name-of-container
docker stop name-of-container
docker rm name-of-container1 name-of-container2 ...
docker rmi -f name-of-image
docker ps
docker ps -a
docker ps -l
```

___ 

##### Apps:

```text
git
openssh-server
openssh-client
nano
curl
wget
software-properties-common
python-software-properties
oracle jdk 8
apache maven 3.3.9
tomcat 8
```