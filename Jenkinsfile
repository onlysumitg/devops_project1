pipeline {
    // tell jenkins that we are going to use dockerfile
    agent any

    stages {
        def app 

        stage('Get code from github') {
            steps
            {
                git branch: 'main', url: 'https://github.com/onlysumitg/devops_project1.git'
            }
        }
 
        stage('Build docker image') {
            steps
            {
               app = docker.build("onlysumitg/devops-project1")    
            }
        } 
    }


}