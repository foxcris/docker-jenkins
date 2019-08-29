#!/bin/bash

/etc/init.d/cron start
/sbin/tini -- /usr/local/bin/jenkins.sh
