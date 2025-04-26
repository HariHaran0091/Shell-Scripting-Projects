#!/bin/bash

#####################
#This script describes the list of resources by AWS
# AUTHOR : Hariharan/Devops Team
# DATE : 25/04/2025
# Version : v0.0.1
######################

#Following are the supported AWS Services by the script
#EC2
#S3
#RDS
#DynamoDB
#Lamda
#EBS
#ELB
#CloudFront
#CloudWatch
#SNS
#SQS
#Route53
#VPC
#CloudFormation
#IAM

#Usage:/aws_resources.list.sh <region> <service name>
#example: ./aws_resources.list.sh <us-east-1> <EC2>

########################

#check if the required number of arguments are passed

if [ $# -ne 2 ]; then
echo "Usage: ./aws_resource_list.sh <aws_region> <aws_services>"
echo "Example: ./aws_resource_list.sh us-east-1 ec2"
exit 1
fi
# Assign the arguments to variables and convert the service to lowercase
aws_region=$1
aws_service=$2

#check if the AWS CLI is installed

if ! command -v aws &> /dev/null; then
echo "AWS CLI is not installed . Please install AWS CLI and try again"
exit 1
fi

#check the AWS CLI is Configured
if [ ! -d ~/.aws ]; then
echo "AWS CLI is not configured.Please Configure AWS CLI and try again"
exit 1
fi

#Execute the CLI command based on the service name

case $2 in

    ec2)
        echo "Listing EC2 Instances in $aws_region"
        aws ec2 describe-instances --region $1
        ;;
    rds)
        echo "Listing RDS Instances in $aws_region"
        aws rds describe-db-instances --region $1
        ;;
    s3)
        echo "Listing S3 Buckets in $aws_region"
        aws s3api list-buckets --region $1
        ;;
    cloudfront)
        echo "Listing CloudFront Distributions in $aws_region"
        aws cloudfront list-distributions --region $1
        ;;
    vpc)
        echo "Listing VPCs in $aws_region"
        aws ec2 describe-vpcs --region $1
        ;;
    iam)
        echo "Listing IAM Users in $aws_region"
        aws iam list-users --region $1
        ;;
    route5)
        echo "Listing Route53 Hosted Zones in $aws_region"
        aws route53 list-hosted-zones --region $1
        ;;
    cloudwatch)
        echo "Listing CloudWatch Alarms in $aws_region"
        aws cloudwatch describe-alarms --region $1
        ;;
    cloudformation)
        echo "Listing CloudFormation Stacks in $aws_region"
        aws cloudformation describe-stacks --region $1
        ;;
    lambda)
        echo "Listing Lambda Functions in $aws_region"
        aws lambda list-functions --region $1
        ;;
    sns)
        echo "Listing SNS Topics in $aws_region"
        aws sns list-topics --region $1
        ;;
    sqs)
        echo "Listing SQS Queues in $aws_region"
        aws sqs list-queues --region $1
        ;;
    dynamodb)
        echo "Listing DynamoDB Tables in $aws_region"
        aws dynamodb list-tables --region $1
        ;;
    ebs)
        echo "Listing EBS Volumes in $aws_region"
        aws ebs describe-volumes --region $1
        ;;
    *)
        echo "Invalid service. Please enter a valid service."
        exit 1
        ;;
esac
