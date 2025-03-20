pipeline {
    agent any

    tools{
        jdk 'jdk17'
        maven 'maven3'
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', credentialsId: 'git-token', url: 'https://github.com/SalmanSk7/galaxyWebLinksCaseStudy.git'
            }
        }

        stage('File System Scan') {
            steps {
               sh "trivy fs --format table -o trivy-fs-output.html ./"
            }
        }

        stage('buildTagPushAnalyticsService') {
            steps {
                withDockerRegistry(credentialsId: 'docker', url: 'https://index.docker.io/v1/') {
                    sh "docker build -t salmansk15/galaxycasestudy:analyticsservice ./pythonCode/AnalyticsService"
                    sh "trivy image --format table -o analyticsservice-image-report.html salmansk15/galaxycasestudy:analyticsservice"
                    sh "docker push salmansk15/galaxycasestudy:analyticsservice"
                }
            }
        }

        stage('buildTagPushAuthService') {
            steps {
                withDockerRegistry(credentialsId: 'docker', url: 'https://index.docker.io/v1/') {
                    sh "docker build -t salmansk15/galaxycasestudy:authservice ./pythonCode/AuthService"
                    sh "trivy image --format table -o authservice-image-report.html salmansk15/galaxycasestudy:authservice"
                    sh "docker push salmansk15/galaxycasestudy:authservice"
                }
            }
        }

        stage('buildTagPushBillingService') {
            steps {
                withDockerRegistry(credentialsId: 'docker', url: 'https://index.docker.io/v1/') {
                    sh "docker build -t salmansk15/galaxycasestudy:billingservice ./pythonCode/BillingService"
                    sh "trivy image --format table -o billingservice-image-report.html salmansk15/galaxycasestudy:billingservice"
                    sh "docker push salmansk15/galaxycasestudy:billingservice"
                }
            }
        }

        stage('buildTagPushIntegrationService') {
            steps {
                withDockerRegistry(credentialsId: 'docker', url: 'https://index.docker.io/v1/') {
                    sh "docker build -t salmansk15/galaxycasestudy:integrationservice ./pythonCode/IntegrationService"
                    sh "trivy image --format table -o integrationservice-image-report.html salmansk15/galaxycasestudy:integrationservice"
                    sh "docker push salmansk15/galaxycasestudy:integrationservice"
                }
            }
        }

        stage('buildTagPushInventoryService') {
            steps {
                withDockerRegistry(credentialsId: 'docker', url: 'https://index.docker.io/v1/') {
                    sh "docker build -t salmansk15/galaxycasestudy:inventoryservice ./pythonCode/InventoryService"
                    sh "trivy image --format table -o inventoryservice-image-report.html salmansk15/galaxycasestudy:inventoryservice"
                    sh "docker push salmansk15/galaxycasestudy:inventoryservice"
                }
            }
        }

        stage('buildTagPushNotifyService') {
            steps {
                withDockerRegistry(credentialsId: 'docker', url: 'https://index.docker.io/v1/') {
                    sh "docker build -t salmansk15/galaxycasestudy:notifyservice ./pythonCode/NotifyService"
                    sh "trivy image --format table -o notifyservice-image-report.html salmansk15/galaxycasestudy:notifyservice"
                    sh "docker push salmansk15/galaxycasestudy:notifyservice"
                }
            }
        }

        stage('buildTagPushPaymentService') {
            steps {
                withDockerRegistry(credentialsId: 'docker', url: 'https://index.docker.io/v1/') {
                    sh "docker build -t salmansk15/galaxycasestudy:paymentservice ./pythonCode/PaymentService"
                    sh "trivy image --format table -o paymentservice-image-report.html salmansk15/galaxycasestudy:paymentservice"
                    sh "docker push salmansk15/galaxycasestudy:paymentservice"
                }
            }
        }


        stage('buildTagPushReportingService') {
            steps {
                withDockerRegistry(credentialsId: 'docker', url: 'https://index.docker.io/v1/') {
                    sh "docker build -t salmansk15/galaxycasestudy:reportingservice ./pythonCode/ReportingService"
                    sh "trivy image --format table -o reportingservice-image-report.html salmansk15/galaxycasestudy:reportingservice"
                    sh "docker push salmansk15/galaxycasestudy:reportingservice"
                }
            }
        }

        stage('buildTagPushSupportService') {
            steps {
                withDockerRegistry(credentialsId: 'docker', url: 'https://index.docker.io/v1/') {
                    sh "docker build -t salmansk15/galaxycasestudy:supportservice ./pythonCode/SupportService"
                    sh "trivy image --format table -o supportservice-image-report.html salmansk15/galaxycasestudy:supportservice"
                    sh "docker push salmansk15/galaxycasestudy:supportservice"
                }
            }
        }

        stage('buildTagPushUserService') {
            steps {
                withDockerRegistry(credentialsId: 'docker', url: 'https://index.docker.io/v1/') {
                    sh "docker build -t salmansk15/galaxycasestudy:userservice ./pythonCode/UserService"
                    sh "trivy image --format table -o userservice-image-report.html salmansk15/galaxycasestudy:userservice"
                    sh "docker push salmansk15/galaxycasestudy:userservice"
                }
            }
        }

        stage('helmPackage and upload to docker') {
            steps {
               sh "helm package galaxycasestudy-helm/"
               sh "helm push galaxycasestudy-helm-0.1.0.tgz oci://registry-1.docker.io/salmansk15"
            }
        }


    }
}
