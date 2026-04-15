pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/HarinathaNaidu-web/terraform-repo.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Approval & Apply/Destroy') {
            steps {
                script {
                    try {
                        // Approval step
                        input message: 'Approve Terraform Apply?', ok: 'Apply'

                        // If approved → Apply
                        echo "Approval received. Running Terraform Apply..."
                        sh 'terraform apply -auto-approve'

                    } catch (err) {
                        // If denied/aborted → Destroy
                        echo "Approval denied or aborted. Running Terraform Destroy..."
                        sh 'terraform destroy -auto-approve'
                    }
                }
            }
        }
    }
}
