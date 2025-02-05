pipeline {
    agent any
    stages {
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
                    sh 'terraform plan -out=tfplan.txt'
                    archiveArtifacts allowEmptyArchive: true, artifacts: 'terraform/tfplan.txt'
                }
            }
        }
        stage('Approval') {
            steps {
                script {
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
                    sh 'terraform apply "terraform/tfplan.txt"'
                }
            }
        }
    }
}

