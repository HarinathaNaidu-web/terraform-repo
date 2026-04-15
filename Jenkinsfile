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

        stage('Approval') {
            steps {
                script {
                    try {
                        input message: 'Approve Terraform Apply?', ok: 'Apply'
                        env.APPROVED = "true"
                    } catch (err) {
                        env.APPROVED = "false"
                    }
                }
            }
        }

        stage('Terraform Apply') {
            when {
                expression { env.APPROVED == "true" }
            }
            steps {
                sh 'terraform apply -auto-approve'
            }
        }

        stage('Terraform Destroy') {
            when {
                expression { env.APPROVED == "false" }
            }
            steps {
                echo "Approval rejected. Running destroy..."
                sh 'terraform destroy -auto-approve'
            }
        }
    }
}
