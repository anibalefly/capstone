## Capstone Project Overview

This capstone project is a simple Hello World application running in an nginx container deployed on
to an AWS EKS cluster.

### Key Files and Directory Structure

* Dockerfile - the docker build file to create the container image to deploy
* Jenkinsfile - the Jenkins pipelines used for CI/CD of this project
* html/* - the static content of the application running in the container
* cf/* - AWS CloudFormation scripts to create a VPC + EKS cluster to deploy the application on
* k8s/* - Initial Kubernetes manifest to deploy and run the application in EKS

### Jenkins Pipeline Steps

* Lint HTML - validates the static content in the html/ directory
* Lint Dockerfile - validates the Dockerfile used to build the application
* Build capstone application image - builds the Docker container image with the build number used as the tag
* Push image to Dockerhub - uploads the built image to Dockerhub so it can be deployed onto Kubernetes
* Remove Unused docker image locallly - cleans up the built docker image from the Jenkins CI/CD server
* Deploy image to EKS - performs a rolling deployment of the application to EKS (assumption is that the
  EKS cluster has been created, and the application has already been deployed at least once using the K8s
  manifest in the k8s/ directory)