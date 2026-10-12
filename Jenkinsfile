pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Pulls the latest code from your Git repository
                checkout scm
            }
        }
        
        stage('Build with Maven') {
            steps {
                // Compiles the Java code and creates the JAR file using Maven
                // Note: If your Jenkins server is running locally on Windows, change 'sh' to 'bat'
                sh 'mvn clean package -DskipTests'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // Builds the Docker container using the Dockerfile we created
                // Note: If your Jenkins server is running locally on Windows, change 'sh' to 'bat'
                sh 'docker build -t my-java-app:latest .'
            }
        }
    }
}