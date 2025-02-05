pipeline {
    agent any  // This specifies the label for the node (use 'any' to allow the pipeline to run on any available agent)
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout code from Git repository
                git 'https://github.com/aishwarya-9patil/vpc-ec2-s3-terraform-jenkins.git'
            }
        }
        
        stage('Setup') {
            steps {
                script {
                    // Add any setup logic for your environment here, for example installing dependencies
                    echo 'Setting up the environment'
                }
            }
        }

        stage('Deploy EC2 and S3') {
            steps {
                script {
                    // Add your deployment steps for EC2 and S3 here
                    echo 'Deploying EC2 and S3'
                }
            }
        }
        
        stage('Clean Up') {
            steps {
                cleanWs()  // Cleans the workspace
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
    }
}
