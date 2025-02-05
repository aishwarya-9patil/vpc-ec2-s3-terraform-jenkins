pipeline {
    agent any
    environment {
        // Inject AWS credentials into environment variables
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')  // Replace 'AWS_ACCESS_KEY_ID' with your Jenkins credentials ID for AWS Access Key
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')  // Replace 'AWS_SECRET_ACCESS_KEY' with your Jenkins credentials ID for AWS Secret Key
    }
    stages {
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
                    // Run Terraform plan and output to tfplan.txt
                    sh 'terraform plan -out=tfplan.txt'
                    // Archive the Terraform plan
                    archiveArtifacts allowEmptyArchive: true, artifacts: 'terraform/tfplan.txt'
                }
            }
        }
        stage('Approval') {
            steps {
                script {
                    // Check if the plan file exists and output the content for approval
                    def planFile = 'terraform/tfplan.txt'
                    if (fileExists(planFile)) {
                        def planContent = readFile(planFile)
                        echo "Plan: ${planContent}"
                    } else {
                        error "Terraform plan file not found!"
                    }
                }
            }
        }
        stage('Terraform Apply') {
            when {
                beforeAgent true
                expression { return params.Approve }
            }
            steps {
                script {
                    // Apply the Terraform plan
                    sh 'terraform apply "terraform/tfplan.txt"'
                }
            }
        }
    }
}


