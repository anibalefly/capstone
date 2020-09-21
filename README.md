## Capstone Project Overview

This capstone project is a simple Hello World application running in an nginx container deployed on
to an AWS EKS cluster.

### Key Files and Directory Structure

* Dockerfile - the docker build file to create the container image to deploy
* Jenkinsfile - the Jenkins pipelines used for CI/CD of this project
* html/* - the static content of the application running in the container
* cf/* - AWS CloudFormation scripts to create a VPC + EKS cluster to deploy the application on
* k8s/* - Initial Kubernetes manifest to deploy and run the application in EKS
