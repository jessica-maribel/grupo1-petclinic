pipeline {
    agent none
    stages {
        stage('Maven Install') {
            agent {
                docker {
                    image 'maven:3.9.6-eclipse-temurin-17'
                    args '-v /root/.m2:/root/.m2' 
                }
            }
            steps {
                sh './mvnw spring-javaformat:apply'  
                sh './mvnw clean install -B -DskipTests'
            }
        }
        stage('Docker Build') {
            agent any 
            steps {
                sh 'docker --version'
                sh 'docker build -t grupo01/spring-petclinic:latest .'
            }
        }
    }
}

