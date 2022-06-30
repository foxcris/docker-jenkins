FROM jenkins/jenkins:lts-jdk11

MAINTAINER foxcris

USER root
RUN apt-get update && apt-get -y upgrade && DEBIAN_FRONTEND=noninteractive apt-get install -y nano less unattended-upgrades && apt-get clean

#install docker
RUN apt-get update && apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common wget && apt-get clean
#install docker
RUN wget -O /tmp/gpg_docker.key https://download.docker.com/linux/ubuntu/gpg; \
  if [ `gpg /tmp/gpg_docker.key | grep pub | wc -l` -ne 1 ]; then echo "Mehrere Schlüssel im Docker Keyring gefunden. Abbruch."; exit 23; fi; \
  if [ `gpg /tmp/gpg_docker.key | grep 9DC858229FC7DD38854AE2D88D81803C0EBFCD88 | wc -l` -ne 1 ]; then echo "Erwarteter GPG Key von Docker nicht gefunden. Abbruch."; exit 24; fi; \
  apt-key add /tmp/gpg_docker.key; rm /tmp/gpg_docker.key; \
  echo "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" >> /etc/apt/sources.list; \
  apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y docker-ce docker-ce-cli containerd.io && apt-get clean

RUN usermod -a -G docker jenkins

RUN touch /var/log/cron.log
VOLUME /var/log

ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
