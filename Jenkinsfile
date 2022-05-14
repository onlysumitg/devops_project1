pipeline {

    environment {
        registry = "registry.hub.docker.com/onlysumitg/devops_project1"
        registryCredential = 'dockerhub'
        dockerImage = ''
        buildNumber = 'latest'
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub')

    
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
        stage('Publish Image') {
                    steps{
                        
                          
                            sh "podman login -u $DOCKER_HUB_CREDENTIALS_USR -p $DOCKER_HUB_CREDENTIALS_PSW registry.hub.docker.com" 
                            sh "echo $dockerImage" 
                            sh "podman push $registry:$BUILD_NUMBER"
                    }
            }


     
    }


}