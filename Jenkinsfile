pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = 'your-access-key-id'  // Set your AWS Access Key ID
        AWS_SECRET_ACCESS_KEY = 'your-secret-access-key'  // Set your AWS Secret Access Key
        AWS_DEFAULT_REGION    = 'ap-south-1'  // AWS Region: Mumbai (ap-south-1)
    }

    stages {
        stage('Checkout SCM') {
            steps {
                // Clone your Git repository with the Terraform configuration
                git branch: 'main', url: 'https://github.com/aishwarya-9patil/vpc-ec2-s3-terraform-jenkins.git'
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Initialize Terraform
                    sh 'terraform init'  
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Run terraform plan to check what resources will be created
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Apply the Terraform configuration to create EC2 and S3
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Output') {
            steps {
                script {
                    // Display the EC2 instance public IP and S3 bucket name after creation
                    sh 'terraform output'
                }
            }
        }
        
        stage('Clean Up') {
            steps {
                echo 'Cleaning up resources...'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
    }
}

