# AWS Integration & Cloud Tools – Lesson 1: EC2 Metadata and AWS CLI

## 🟢 Lesson Overview
- **Focus:** Learn how to access EC2 instance metadata and use the AWS CLI
- **Time:** 30 minutes
- **Goal:** Understand how Amazon Linux 2023 integrates with AWS services

## 🔍 Why This Matters
Amazon Linux 2023 is optimized for AWS and includes built-in tools for interacting with AWS services. Understanding how to access instance metadata and use the AWS CLI is essential for managing EC2 instances effectively and integrating with other AWS services.

## 📚 Core Concepts To Learn

| Tool/Concept | Purpose | Example |
|--------------|---------|---------|
| EC2 Metadata Service | Access instance information | Token-based access to instance data |
| IMDSv2 | Secure metadata access (required) | Using session token-based requests |
| AWS CLI | Interact with AWS services | `aws ec2 describe-instances` |
| Instance Roles | Access AWS without keys | IAM roles attached to EC2 |
| User Data | Bootstrap instances | Scripts run at launch |

## ✅ Practice Exercise (20 Minutes)

1. **Access EC2 instance metadata using IMDSv2 (current recommended method)**
   ```bash
   # Get a session token first (required for IMDSv2)
   TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
   
   # List available metadata categories
   curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/
   ```
   Note: Many newer EC2 instances have IMDSv1 disabled for security reasons, requiring the token-based approach.

2. **Access specific metadata information using IMDSv2**
   ```bash
   # Using the token from step 1
   curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id
   curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-type
   curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4
   ```

3. **Alternative: Use the IPv6 endpoint for metadata (for dual-stack instances)**
   ```bash
   # Get token using IPv6 endpoint
   TOKEN=$(curl -X PUT "http://[fd00:ec2::254]/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
   
   # Access metadata using IPv6
   curl -H "X-aws-ec2-metadata-token: $TOKEN" "http://[fd00:ec2::254]/latest/meta-data/"
   ```

4. **Check if AWS CLI is installed**
   ```bash
   aws --version
   ```
   If not installed, install it:
   ```bash
   sudo dnf install -y aws-cli
   ```

5. **Configure AWS CLI (if needed)**
   ```bash
   aws configure
   ```
   Note: If your instance has an IAM role, you may not need to configure credentials.

6. **Test AWS CLI with simple commands**
   ```bash
   # List S3 buckets
   aws s3 ls
   
   # Describe your current instance (using IMDSv2)
   # First get a token and instance ID
   TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
   INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id)
   
   # Then use the instance ID with AWS CLI
   aws ec2 describe-instances --filters "Name=instance-id,Values=$INSTANCE_ID"
   ```

7. **Check for instance user data (using IMDSv2)**
   ```bash
   # Using the token from previous steps
   curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/user-data
   ```
   Note: This may return empty if no user data was provided.

## 🧠 Reflection Questions (5 Minutes)
- How does IMDSv2 improve security over the legacy metadata service?
- Why is using IAM roles with EC2 instances better than storing AWS credentials on the instance?
- How could you use instance metadata in your own scripts?

## 🔍 Exploring Further
- Check your instance's IAM role (using IMDSv2):
  ```bash
  # Get a token if you don't already have one
  TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
  
  # Check IAM role information
  curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/iam/info
  ```
- Explore AWS CLI environment variables:
  ```bash
  aws configure list
  ```

## 📝 Demo Review & Journal Prompt
Today I learned how to access EC2 instance metadata and use the AWS CLI on Amazon Linux 2023.
I practiced both legacy and IMDSv2 methods for accessing metadata.
I also explored how to use the AWS CLI to interact with AWS services.
Next time, I'll learn how to set up and configure the CloudWatch agent for monitoring.

## 🌟 Bonus Challenge
Create a simple script that collects instance metadata and outputs it in a readable format:

```bash
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
```

## 📚 Resources for Further Learning
- [EC2 Instance Metadata and User Data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html)
- [Transition to using IMDSv2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-instance-metadata-service.html)
- [AWS CLI Command Reference](https://awscli.amazonaws.com/v2/documentation/api/latest/index.html)
- [IAM Roles for EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html)