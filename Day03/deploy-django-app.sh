#!/bin/bash

code_clone() {
	echo "cloning the django app..."
	git clone https://github.com/LondheShubham153/django-notes-app.git
}

install_requirements() {
	echo "Installing all the requirements.."
	sudo apt-get update
	sudo apt-get install -y docker.io docker-compose-v2 nginx
}

require_restarts() {
	sudo chown $USER /var/run/docker.sock 
	#sudo systemctl enable docker
	#sudo systemctl enable nginx
	#sudo systemctl restart docker
}

deploy() {
	docker build -t notes-app .
	#docker run -d -p 8000:8000 notes-app:latest
        docker compose up -d
}

echo " ***********************DEPLOYMENT STARTED****************************"

if ! code_clone; then
	echo "The code directory is already exists"
	cd django-notes-app
fi
if ! install_requirements; then
	echo "Installation failed"
	exit 1
fi
if ! require_restarts; then
	echo "system fault identified"
	exit 1
fi 

if ! deploy; then 
	echo "Deployment is failed, mailing the admin"
	# sendmail
	exit 1
fi

echo "************************DEPLOYMENT ENDED*******************************"
