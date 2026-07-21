#!/bin/bash

code_clone() {
    echo "Cloning the Django app..."
    git clone https://github.com/LondheShubham153/django-notes-app.git
}

install_requirements() {
    echo "Installing requirements..."
    sudo apt-get update
    sudo apt-get install -y docker.io docker-compose-v2 nginx
}

require_restarts() {
    sudo systemctl enable docker
    sudo systemctl start docker
}

deploy() {
    docker build -t notes-app .
    docker compose up -d
}

echo "************ DEPLOYMENT STARTED ************"

if ! code_clone; then
    echo "Repository already exists"
    cd django-notes-app
fi

install_requirements || exit 1
require_restarts || exit 1
deploy || exit 1

echo "************ DEPLOYMENT COMPLETED ************"
