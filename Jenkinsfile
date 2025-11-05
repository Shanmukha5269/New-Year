pipeline {
    agent { label "uvce" }
    stages {
        stage ('Code') {
            steps {
                script {
                    if(!fileExists('New-Year')){
                        echo "Clonning New-Year repo......."
                        sh 'git clone https://github.com/Shanmukha5269/New-Year.git'
                        echo "Clonned successfully"
                    }else{
                        echo "Repo already cloned, pulling latest changes..."
                        dir('New-Year'){
                            sh 'git pull'
                        }
                        echo "Pulled successfully"
                    }
                }
            }
        }
        stage ('Build') {
            steps {
                echo "Creating docker image...."
                dir('New-Year') {
                    sh 'pwd'
                    sh 'docker build -t new-year-jenkins .'
                }
                echo "Docker image built successfully"
            }
        }
        stage ('Push to DockerHub') {
            steps {
                echo "Pushing image to docker hub........"
                withCredentials([usernamePassword(
                    credentialsId: 'dockerHubCredentials',
                    usernameVariable: 'DOCKERHUB_USER',
                    passwordVariable: 'DOCKERHUB_PASS'
                )]) {
                    sh '''
                        echo "Logging in to Docker Hub..."
                        echo $DOCKERHUB_PASS | docker login -u $DOCKERHUB_USER --password-stdin
                        docker tag new-year-jenkins $DOCKERHUB_USER/new-year-jenkins:latest
                        docker push $DOCKERHUB_USER/new-year-jenkins:latest
                    '''
                }
            }
        }
        stage ('Deploy') {
            steps {
                echo "Deploying the code in containers........"
                dir('New-Year'){
                    sh 'docker compose up -d'
                }
                //sh 'docker run --name new-year-jenkins -d -p 9000:80 new-year-jenkins'
                //echo "Application is running at http://localhost:9000"
            }
        }
    }
}
