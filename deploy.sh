#!/bin/bash
sudo yum install docker -y
sudo systemctl enable docker
sudo systemctl start docker
sudo docker pull orelbaz/flak-docker:1.0
sudo docker stop \$(sudo docker ps -aq)
sudo docker rm \$(sudo docker ps -aq)
