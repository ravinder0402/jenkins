pipeline {
    agent any // Use any available agent
    stages {
        stage('Check Docker Version') {
            steps {
                script {
                    // Run Docker version command
                    sh 'docker version'
                }
            }
        }
    }
}
