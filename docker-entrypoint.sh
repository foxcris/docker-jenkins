#!/bin/bash

/etc/init.d/cron start
su -c "/bin/tini -- /usr/local/bin/jenkins.sh" jenkins
