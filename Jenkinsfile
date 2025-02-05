pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan -out=tfplan.txt'  // Plan saved to tfplan.txt
                }
            }
        }

        stage('Archive Plan') {
            steps {
                archiveArtifacts artifacts: 'tfplan.txt', allowEmptyArchive: true  // Correct file pattern here
            }
        }

        stage('Approval') {
            steps {
                script {
                    // Approval step to continue (can be manually approved in Jenkins)
                    input message: 'Approve to apply changes?', ok: 'Approve'
                }
            }
        }

        stage('Terraform Apply') {
            when {
                expression {
                    return fileExists('tfplan.txt')  // Ensure the plan file exists before applying
                }
            }
            steps {
                script {
                    sh 'terraform apply tfplan.txt'
                }
            }
        }
    }
    
    post {
        always {
            // Clean up if needed
            cleanWs()
        }
    }
}


