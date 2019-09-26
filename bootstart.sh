#!/bin/sh

# web server for our app in foreground and prevent container from closing
nginx -g daemon off;

# sudo service supervisor start
# Configure supervisor to run the node app.
# cat >/etc/supervisor/conf.d/node-app.conf << EOF
# [program:nodeapp]
# directory=/opt/app/cryptowise_frontend
# command=npm start
# autostart=true
# autorestart=true
# user=nodeapp
# environment=HOME="/home/nodeapp",USER="nodeapp",NODE_ENV="production"
# stdout_logfile=syslog
# stderr_logfile=syslog
# EOF
#
# supervisorctl reread
# supervisorctl update

# Application should now be running under supervisor
