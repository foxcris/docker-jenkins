FROM jenkins/jenkins:lts

MAINTAINER foxcris

USER root
RUN apt-get update && apt-get -y upgrade && DEBIAN_FRONTEND=noninteractive apt-get install -y nano less unattended-upgrades && apt-get clean

#install docker
RUN apt-get update && apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common && apt-get clean
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update && apt-get -y install docker-ce docker-ce-cli containerd.io && apt-get clean
RUN usermod -a -G docker jenkins

RUN touch /var/log/cron.log
VOLUME /var/log

COPY docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh
ENTRYPOINT ["/sbin/tini", "--"]
CMD  ["/docker-entrypoint.sh"]
