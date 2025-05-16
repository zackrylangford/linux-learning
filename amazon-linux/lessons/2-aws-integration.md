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
| EC2 Metadata Service | Access instance information | `curl http://169.254.169.254/latest/meta-data/` |
| IMDSv2 | More secure metadata access | Using token-based requests |
| AWS CLI | Interact with AWS services | `aws ec2 describe-instances` |
| Instance Roles | Access AWS without keys | IAM roles attached to EC2 |
| User Data | Bootstrap instances | Scripts run at launch |

## ✅ Practice Exercise (20 Minutes)

1. **Access EC2 instance metadata using the legacy method**
   ```bash
   curl http://169.254.169.254/latest/meta-data/
   ```
   Explore available metadata categories.

2. **Access specific metadata information**
   ```bash
   curl http://169.254.169.254/latest/meta-data/instance-id
   curl http://169.254.169.254/latest/meta-data/instance-type
   curl http://169.254.169.254/latest/meta-data/local-ipv4
   ```

3. **Try the more secure IMDSv2 approach**
   ```bash
   # Get a token first
   TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
   
   # Use the token for metadata requests
   curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/ami-id
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
   
   # Describe your current instance
   aws ec2 describe-instances --filters "Name=instance-id,Values=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)"
   ```

7. **Check for instance user data**
   ```bash
   curl http://169.254.169.254/latest/user-data
   ```
   Note: This may return empty if no user data was provided.

## 🧠 Reflection Questions (5 Minutes)
- How does IMDSv2 improve security over the legacy metadata service?
- Why is using IAM roles with EC2 instances better than storing AWS credentials on the instance?
- How could you use instance metadata in your own scripts?

## 🔍 Exploring Further
- Check your instance's IAM role:
  ```bash
  curl http://169.254.169.254/latest/meta-data/iam/info
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
# ec2-info.sh - Display EC2 instance information

# Get IMDSv2 token
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# Function to get metadata with token
get_metadata() {
  curl -s -H "X-aws-ec2-metadata-token: $TOKEN" "http://169.254.169.254/latest/meta-data/$1"
}

echo "=== EC2 Instance Information ==="
echo "Instance ID: $(get_metadata instance-id)"
echo "Instance Type: $(get_metadata instance-type)"
echo "AMI ID: $(get_metadata ami-id)"
echo "Hostname: $(get_metadata hostname)"
echo "Local IPv4: $(get_metadata local-ipv4)"
echo "Public IPv4: $(get_metadata public-ipv4 2>/dev/null || echo 'None')"
echo "Availability Zone: $(get_metadata placement/availability-zone)"
echo "IAM Role: $(get_metadata iam/security-credentials/ 2>/dev/null || echo 'None')"
echo "==============================="
```

## 📚 Resources for Further Learning
- [EC2 Instance Metadata and User Data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html)
- [AWS CLI Command Reference](https://awscli.amazonaws.com/v2/documentation/api/latest/index.html)
- [IAM Roles for EC2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html)