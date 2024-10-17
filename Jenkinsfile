pipeline {
    agent {
        docker {
            image 'docker:19.03.12' // Use a Docker image with the Docker CLI
            args '--privileged -v /var/run/docker.sock:/var/run/docker.sock' // Allow privileged operations and Docker socket access
        }
    }
    stages {
        stage('Check Docker Version') {
            steps {
                script {
                    // Run the Docker version command
                    sh 'docker version'
                }
            }
        }
    }
}
