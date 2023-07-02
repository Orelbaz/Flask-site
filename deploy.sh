#!/bin/bash

INSTANCE_IP=$1

ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i /var/lib/jenkins/or.pem ec2-user@${INSTANCE_IP} "
sudo yum install docker -y
sudo systemctl enable docker
sudo systemctl start docker
sudo docker pull orelbaz/flak-docker:1.0
sudo docker stop \$(sudo docker ps -aq)
sudo docker rm \$(sudo docker ps -aq)
sudo docker run -d -p 5000:5000 orelbaz/flak-docker:1.0
"
