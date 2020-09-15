#!/bin/bash

echo "Checking if capstone-cluster-stack exists"
if ! aws cloudformation describe-stacks --region=us-west-2 --stack-name capstone-cluster-stack
then
    echo "Stack capstone-cluster-stack doesn't exist, creating..."
    aws cloudformation create-stack --stack-name capstone-cluster-stack --template-body file://capstone-cluster.yml  --parameters file://capstone-cluster-parameters.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=us-west-2
    #echo "Waiting for capstone-cluster-stack to be created..."
    #aws cloudformation wait stack-create-complete
else
    echo "Stack capstone-cluster-stack exists, updating..."
    aws cloudformation update-stack --stack-name capstone-cluster-stack --template-body file://capstone-cluster.yml  --parameters file://capstone-cluster-parameters.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=us-west-2
fi

