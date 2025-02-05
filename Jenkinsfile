pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION    = 'ap-south-1' // Set AWS region to Mumbai (ap-south-1)
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone the repository containing the Terraform files
                checkout scm
            }
        }
        stage('Set AWS Credentials') {
            steps {
                script {
                    // Load AWS credentials from Jenkins credentials store
                    withCredentials([aws(credentialsId: 'your-aws-credentials-id')]) {
                        // Set environment variables for AWS access key and secret key
                        env.AWS_ACCESS_KEY_ID     = AWS_ACCESS_KEY_ID
                        env.AWS_SECRET_ACCESS_KEY = AWS_SECRET_ACCESS_KEY
                    }
                }
            }
        }
        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init' // Initialize Terraform
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan -out=terraform.plan' // Generate Terraform plan
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve terraform.plan' // Apply Terraform plan
                }
            }
        }
        stage('Output') {
            steps {
                script {
                    // Print output from Terraform
                    sh 'terraform output'
                }
            }
        }
    }
    post {
        always {
            // Clean up or destroy any resources if needed
            echo 'Pipeline completed.'
        }
    }
}
