pipeline {
    environment {
        registry = "harbor-registry-mndc.uidai.gov.in/others"
        registryCredential = ''
        dockerImage = ''
    }
    agent any
    stages {
        stage('Cloning Git') {
            steps {
                git '/opt/git/helloworld'
            }
        }
        stage('Building Image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Pushing Image to Registry') { 
            steps { 
                script { 
                    docker.withRegistry( '', registryCredential ) { 
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
