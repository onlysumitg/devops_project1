pipeline {

    environment {
        registry = "registry.hub.docker.com/onlysumitg/devops_project1"
        registryCredential = 'dockerhub'
        dockerImage = ''
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub')
        CONTAINER_NAME = 'achistar'
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

        stage('Stop existing container') {
                    steps{
                            
                            sh "podman stop $CONTAINER_NAME || true "
                            sh "podman rm $CONTAINER_NAME || true " 
                      
                    }
            }

        stage('Run container') {
                    steps{

                            sh "JENKINS_NODE_COOKIE=dontKillMe podman run -d -p 8000:8000 --name=$CONTAINER_NAME $registry:$BUILD_NUMBER" 
                      
                    }
            }

     
    }


}