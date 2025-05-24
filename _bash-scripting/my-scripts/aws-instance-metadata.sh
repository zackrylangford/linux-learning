#!/bin/bash
# ec2-info.sh - Display EC2 instance information using IMDSv2

# Get IMDSv2 token (valid for 6 hours)
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Function to get metadata with token
get_metadata() {
  curl -s -H "X-aws-ec2-metadata-token: $TOKEN" "http://169.254.169.254/latest/meta-data/$1"
}

# Function to handle potential errors
get_metadata_safe() {
  get_metadata "$1" 2>/dev/null || echo 'Not available'
}

echo "=== EC2 Instance Information ==="
echo "Instance ID: $(get_metadata instance-id)"
echo "Instance Type: $(get_metadata instance-type)"
echo "AMI ID: $(get_metadata ami-id)"
echo "Hostname: $(get_metadata hostname)"
echo "Local IPv4: $(get_metadata local-ipv4)"
echo "Public IPv4: $(get_metadata_safe public-ipv4)"
echo "Availability Zone: $(get_metadata placement/availability-zone)"
echo "Region: $(get_metadata placement/region)"
echo "IAM Role: $(get_metadata_safe iam/security-credentials/)"
echo "Instance Profile: $(get_metadata_safe iam/info | grep -o 'InstanceProfileArn.*\"' | cut -d'"' -f3)"
echo "==============================="