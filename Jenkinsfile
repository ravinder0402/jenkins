pipeline {
    agent any
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'graddle:8.2.0-jdk17-alpine'
                    reuseNode true
                }
            }
            steps {
                sh 'gradle --version'
            }
        }
    }
}
