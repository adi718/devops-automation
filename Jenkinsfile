pipeline {
    agent any
        tools{
            maven 'maven_3_5_0'
        }
    stages{
        stage('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/adi718/devops-automation']])
                sh 'mvn clean install'
            }
        }
        stage('Build Docker Image'){
            steps{
                sh 'docker build -t javatechie/devops-integration .'
                sh 'docker tag javatechie/devops-integration adityayadav75310/devops-adi'
            }
        }
        stage('Push Image to the Docker HUB'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerpwd')]) {
                    sh 'docker login -u adityayadav75310 -p ${dockerpwd}'
}
                    sh 'docker push adityayadav75310/devops-adi'
                }
            }
        }
    }
}