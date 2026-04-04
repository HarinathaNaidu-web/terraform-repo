pipeline {
    agent any

    environment {
        TF_IN_AUTOMATION = "true"
        EMAIL_RECIPIENT = "harinatha.naidu@nam-it.com"   // change this
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Format Check') {
            steps {
                sh 'terraform fmt -check'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                terraform plan -out=tfplan
                terraform show tfplan
                '''
            }
        }

        stage('Approval Required') {
            when {
                branch 'main'
            }
            steps {
                script {
                    emailext (
                        subject: "Jenkins Approval Required: Terraform Apply",
                        body: """
                        Hello,

                        Terraform plan is ready for APPLY.

                        Please review and approve in Jenkins:

                        ${env.BUILD_URL}

                        Thanks,
                        Jenkins
                        """,
                        to: "${EMAIL_RECIPIENT}"
                    )
                }
            }
        }

        stage('Terraform Apply') {
            when {
                branch 'main'
            }
            steps {
                input message: "Approve Terraform Apply?"
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}
