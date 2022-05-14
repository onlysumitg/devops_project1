pipeline {
    // tell jenkins that we are going to use dockerfile
    agent { dockerfile true }

    stages {
        stage('Get code from github') {
            steps
            {
                git branch: 'main', url: 'https://github.com/onlysumitg/devops_project1.git'
            }
        }
        
        stage('Build Image') {}
        stage('Publish Image') {}
        stage('Deploy app') {}
    }
}