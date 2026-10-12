pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build with Maven') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t my-java-app:latest .'
            }
        }
    }
}