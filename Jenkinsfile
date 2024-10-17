pipeline {
    agent {
        docker {
            image 'docker:latest' // Use Docker image for building
            args '--privileged' // Allow privileged operations
        }
    }
    stages {
        stage('Pull Nginx Image') {
            steps {
                script {
                    // Pull the Nginx image
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
                    // Push the image to a container registry (if needed)
                    // sh 'docker push my-nginx-image'

                    // Apply the deployment configuration
                    sh '''
                    kubectl apply -f - <<EOF
                    apiVersion: apps/v1
                    kind: Deployment
                    metadata:
                      name: my-nginx
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
