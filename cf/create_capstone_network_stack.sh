#!/bin/bash

echo "Checking if capstone-network-stack exists"
if ! aws cloudformation describe-stacks --region=us-west-2 --stack-name capstone-network-stack
then
    echo "Stack capstone-network-stack doesn't exist, creating..."
    aws cloudformation create-stack --stack-name capstone-network-stack --template-body file://capstone-network.yml  --parameters file://capstone-network-parameters.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=us-west-2
    #echo "Waiting for capstone-network-stack to be created..."
    #aws cloudformation wait stack-create-complete
else
    echo "Stack capstone-network-stack exists, updating..."
    aws cloudformation update-stack --stack-name capstone-network-stack --template-body file://capstone-network.yml  --parameters file://capstone-network-parameters.json --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" --region=us-west-2
fi

