pipeline {
    agent none
    stages {
        stage('Maven Install') {
            agent {
                docker {
                    image 'maven:3.9.6-eclipse-temurin-17'
                    args '-v /root/.m2:/root/.m2'  // cache Maven
                }
            }
            steps {
                sh 'mvn spring-javaformat:apply'
                sh 'mvn io.spring.javaformat:spring-javaformat-maven-plugin:0.0.20:apply
                sh './mvnw spring-javaformat:apply'   // solo una vez
                sh './mvnw clean install -B -DskipTests'
            }
        }
        stage('Docker Build') {
            agent any // usa nodo con Docker instalado
            steps {
                sh 'docker --version'
                sh 'docker build -t grupo01/spring-petclinic:latest .'
            }
        }
    }
}

