#!/bin/bash

sudo yum -y install epel-release
sudo yum -y install snapd
sudo systemctl enable snapd
sudo systemctl start snapd
sleep 5
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install microk8s --classic
sleep 5

. /etc/profile.d/snapd.sh 
microk8s.enable registry

sudo snap alias microk8s.kubectl kubectl
# or
# microk8s.config > $HOME/.kube/config

sudo snap alias microk8s.docker docker
# or
# docker -H unix:///var/snap/microk8s/docker.sock ...

exec bash
