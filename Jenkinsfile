pipeline {

    environment {
        registry = "registry.hub.docker.com/onlysumitg/devops_project1"
        registryCredential = 'dockerhub'
        dockerImage = ''
        buildNumber = 'latest'
    
    }

    // tell jenkins that we are going to use dockerfile
    agent any

    stages {
       

        stage('Get code from github') {
            steps
            {
                git branch: 'main', url: 'https://github.com/onlysumitg/devops_project1.git'
            }
        }
 
        stage('Build docker image') {
               steps{
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
               }
        } 

        stage('Deploy our image') {
                    steps{
                        script {
                            docker.withRegistry( 'registry.hub.docker.com', registryCredential ) {
                                dockerImage.push()
                            }
                        }
                    }
            }
    }


}