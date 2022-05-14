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
 
    }
}