pipeline {
    agent {
        docker {
            image 'docker:latest' // Use Docker image for buildping
            args '--privileged -v /var/run/docker.sock:/var/run/docker.sock' // Allow privileged operations and Docker socket access
        }
    }
    stages {
        stage('Pull Nginx Image') {
            steps {
                script {
                    // Pull the Nginx image (not strictly necessary for this pipeline)
                    sh 'docker pull nginx:alpine'
                }
            }
        }
        stage('Build Custom Image') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile
                    sh 'docker build -t my-nginx-image .'
                }
            }
        }
        stage('Deploy to k3s') {
            steps {
                script {
                    // Apply the deployment configuration
                    sh '''
                    kubectl apply -f - <<EOF
                    apiVersion: apps/v1
                    kind: Deployment
                    metadata:
                      name: my-nginx
                      namespace: default # Change if you have a specific namespace
                    spec:
                      replicas: 1
                      selector:
                        matchLabels:
                          app: my-nginx
                      template:
                        metadata:
                          labels:
                            app: my-nginx
                        spec:
                          containers:
                          - name: my-nginx
                            image: my-nginx-image
                            ports:
                            - containerPort: 80
                    EOF
                    '''
                }
            }
        }
    }
}
