# Docker Container running jenkins

Docker packages are addistionally installed to allow jenkins to build docker containers and push them to the regeistry.
Unattended-updated are run via cron to keep the container up-to-date with security updates even if no new docker image is available.
 
## Configuration
 
###Configuration files, log files, buisness data
The following directories can be loaded from the host to keep the data and configuration files out of the container:

 | PATH in container | Description |
 | ---------------------- | ----------- |
 | /var/jenkins_home | Directory of all jenkins configuration files |
 | /root/.docker | Directory of the docker crendetial store |
 | /var/log | Logging directory |
 
## Container Tags

 | Tag name | Description |
 | ---------------------- | ----------- |
 | latest | Latest stable version of the container |
 | stable | Latest stable version of the container |
 | master | latest development version of the container. Do not use in production environments! |
 | dev | deprecated development version |

## Usage

To run the container and store the data and configuration on the local host run the following commands:
1. Create storage directroy for the configuration files, log files and data. Also create a directroy to store the necessary script to create the docker container and replace it (if not using eg. watchtower)
```
mkdir /srv/docker/jenkins
mkdir /srv/docker-config/jenkins
```

2. Create the docker container and configure the docker networks for the container. I always create a script for that and store it under
```
touch /srv/docker-config/dirvish/create.sh
```
Content of create.sh:
```
#!/bin/bash

version=stable

docker pull foxcris/docker-jenkins:${version}
docker create\
 --restart always\
 --name jenkins\
 --volume "/srv/docker/jenkins/var/jenkins_home:/var/jenkins_home"\
 --volume "/srv/docker/jenkins/var/log:/var/log"\
 foxcris/docker-dirvish:${version}
```

3. Create replace.sh to install/update the container. Store it in
```
touch /srv/docker-config/jenkins/replace.sh
```
```
#/bin/bash
docker stop jenkins
docker rm jenkins
./create.sh
docker start jenkins
``` 
