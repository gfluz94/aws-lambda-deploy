#!/usr/bin/env bash

### CREATING REPOSITORY AND PUSHING TO AWS ECR
docker build -t $REPO_NAME .
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com
docker tag $REPO_NAME:latest 198187314419.dkr.ecr.us-east-1.amazonaws.com/$REPO_NAME:latest
docker push $AWS_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/$REPO_NAME:latest