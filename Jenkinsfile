pipeline {
    agent any
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'gradle:8.2.0-jdk17-alpine'
                    reuseNode true
                }
            }
            steps {
                sh 'gradle --version'
            }
        }
    }
}
sudo apt install -y curl wget
curl -sfL https://get.k3s.io | sh
sudo systemctl status k3s
mkdir ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config && sudo chown $USER ~/.kube/config
sudo chmod 600 ~/.kube/config && export KUBECONFIG=~/.kube/config
kubectl get nodes
