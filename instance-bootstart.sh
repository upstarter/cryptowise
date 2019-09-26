#!/bin/sh
# FRONTEND HOST OS STARTUP SCRIPT
set -v

# Talk to the metadata server to get the project id
# PROJECTID=$(curl -s "http://metadata.google.internal/computeMetadata/v1/project/project-id" -H "Metadata-Flavor: Google")
# REPOSITORY="[YOUR-REPOSITORY]"

# Install logging monitor. The monitor will automatically pick up logs sent to
# syslog.
# curl -s "https://storage.googleapis.com/signals-agents/logging/google-fluentd-install.sh" | bash
# service google-fluentd restart &

# Install dependencies from apt
apt-get update
apt-get install -yq ca-certificates git nginx

#!/bin/sh
set -ex

export PORT=8080
export HOME=/app
mkdir -p ${HOME}
cd ${HOME}
RELEASE_URL=$(curl \
    -s "http://metadata.google.internal/computeMetadata/v1/instance/attributes/release-url" \
    -H "Metadata-Flavor: Google")
gsutil cp -r ${RELEASE_URL} .
chmod 755 cw-web-release
wget https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 \
    -O cloud_sql_proxy
chmod +x cloud_sql_proxy
mkdir /tmp/cloudsql
PROJECT_ID=$(curl \
    -s "http://metadata.google.internal/computeMetadata/v1/project/project-id" \
    -H "Metadata-Flavor: Google")
./cloud_sql_proxy -projects=${PROJECT_ID} -dir=/tmp/cloudsql &
# PORT=8080 ./cw-web-release start

cat > /etc/nginx/conf.d/cw.conf << END_TEXT
server {
    server_name localhost; #example.com www.example.com;

    location / {
        root  /app/cw-web-release;
        index  index.html index.htm;
        try_files $uri $uri/ =404;
    }

    error_page  500 502 503 504  /50x.html;
    location = /50x.html {
        root  /usr/share/nginx/html;
    }
}
END_TEXT

systemctl start nginx


# Install nodejs
# mkdir /opt/nodejs
# curl https://nodejs.org/dist/v8.12.0/node-v8.12.0-linux-x64.tar.gz | tar xvzf - -C /opt/nodejs --strip-components=1
# ln -s /opt/nodejs/bin/node /usr/bin/node
# ln -s /opt/nodejs/bin/npm /usr/bin/npm

# Get the application source code from the Google Cloud Repository.
# git requires $HOME and it's not set during the startup script.
# export HOME=/root
# git config --global credential.helper gcloud.sh
# git clone https://source.developers.google.com/p/${PROJECTID}/r/${REPOSITORY} /app
