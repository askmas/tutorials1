#!/usr/bin/env bash

# create Eb docker run file in deploy folder and deploy to EB
rm -rf deploy
mkdir deploy
cd deploy
EBS_DEPLOY='
{
  "AWSEBDockerrunVersion": "1",
  "Image": {
    "Name": "masoodmjan/tutorials:latest",
    "Update": "true"
  },
  "Ports": [
    {
      "ContainerPort": "4000"
    }
  ]
}'

echo $EBS_DEPLOY > Dockerrun.aws.json
export PATH=/root/.local/bin:$PATH
eb init --region eu-west-1 --platform docker tutorials1-ebs 

# EB_Action : create or deploy
eb ${EB_Action} tutorials1-ebs  --region eu-west-1
