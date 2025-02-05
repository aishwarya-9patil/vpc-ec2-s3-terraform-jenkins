pipeline {
    agent any
    
    stages {
        stage('Checkout SCM') {
            steps {
                // Ensure the correct branch is specified in this section
                git branch: 'main', url: 'https://github.com/aishwarya-9patil/vpc-ec2-s3-terraform-jenkins.git'
            }
        }

        stage('Setup') {
            steps {
                echo "Setting up..."
            }
        }

        stage('Deploy EC2 and S3') {
            steps {
                echo "Deploying EC2 and S3..."
            }
        }

        stage('Clean Up') {
            steps {
                echo "Cleaning up..."
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline finished.'
        }
    }
}

