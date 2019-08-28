#!/bin/bash

/etc/init.d/cron start
su -c "/sbin/tini -- /usr/local/bin/jenkins.sh" jenkins
