pipeline {
    environment {
        registry = "harbor-registry-mndc.uidai.gov.in/others"
        dockerImage = ''
    }
    agent any
    stages {
        stage('Cloning Git') {
            steps {
                git 'https://github.com/bhaskar-cloud/helloworld.git'
            }
        }
        stage('Building Image') {
            steps {
                script {
                    dockerImage = docker.build("helloworld") registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Pushing Image to Registry') { 
            steps { 
                script { 
                    docker.withRegistry('harbor-registry-mndc.uidai.gov.in/others') { 
                        dockerImage.push() 
                    }
                } 
            }
        } 
        stage('Cleaning up') { 
            steps { 
                sh "docker rmi $registry:$BUILD_NUMBER" 
            }
        } 
    }
}
