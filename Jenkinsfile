pipeline {
    agent any
    environment {
        // Make sure the credentials ID matches the one you stored in Jenkins
        AWS_CREDENTIALS_ID = 'aws-jenkins-creds'
    }
    stages {
        stage('Checkout SCM') {
            steps {
                // Checkout your repository
                checkout scm
            }
        }
        
        stage('Run Terraform') {
            steps {
                node {
                    // Ensure AWS credentials are available for Terraform
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY',
                        credentialsId: AWS_CREDENTIALS_ID
                    ]]) {
                        // Here you can run your Terraform commands to setup EC2, S3, VPC
                        sh '''
                            # Terraform initialization and apply
                            terraform init
                            terraform apply -auto-approve
                        '''
                    }
                }
            }
        }
    }
    post {
        always {
            // Clean up workspace after pipeline runs, wrapped in a node block
            node {
                cleanWs()
            }
        }
    }
}
