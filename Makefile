# FRONTEND
zone := us-central1-f

release:
	@$(MAKE) bundle
	gsutil cp -r dist/ gs://${BUCKET_NAME}/cw-web-release

bundle:
	yarn bundle
	# push to instance?

# build container, publish release in container-registry, create/update instance
old_deploy:
	$(MAKE) build_image \
		&& $(MAKE) push_image \
		&& $(MAKE) create_instance \
		&& $(MAKE) progress

ssh:
	gcloud compute ssh --project eternal-sunset-206422 \
		--zone us-central1-f cw-web-instance

image:
	docker build -t cw-web-image .

run:
	docker run -it cw-web-image /bin/bash

push_image:
	docker tag cw-web-image \
		gcr.io/eternal-sunset-206422/cw-web-image:latest \
		&& docker push gcr.io/eternal-sunset-206422/cw-web-image:latest

create:
	gcloud compute instances create cw-web-instance${N} \
		--image-family debian-9 \
		--image-project debian-cloud \
		--metadata-from-file startup-script=instance-bootstart.sh  \
		--machine-type f1-micro \
		--scopes "userinfo-email,cloud-platform,storage-ro" \
		--metadata release-url=gs://${BUCKET_NAME}/cw-web-release \
		--zone ${zone} \
		--tags "https-server,http-server"

# check progress of instance creation
progress:
	gcloud compute instances get-serial-port-output cw-web-instance \
		--zone us-central1-f

# google has a default 8080 already
firewall:
	gcloud compute firewall-rules create http-server-allow-http-8080 \
		--allow tcp:8080 \
		--source-ranges 0.0.0.0/0 \
		--target-tags http-server \
		--description "Allow port 80 access to http-server"

list:
	gcloud compute instances list
	echo To see your application running, go to
	echo http://IP_ADDRESS:8080 where IP_ADDRESS is the external address you
	echo obtained above.

log:
	sudo journalctl -u google-startup-scripts.service

# HANDY DANDIES:
# docker run -it gcr.io/eternal-sunset-206422/cw-proxy /bin/bash
# psql -h /tmp/cloudsql/eternal-sunset-206422:us-central1:master-proxy -U postgres

# sudo google_metadata_script_runner --script-type startup --debug

# git submodule add https://github.com/upstarter/crypto
# once pulled:
# git clone --recurse-submodules git@github.com:upstarter/cryptowise.git
