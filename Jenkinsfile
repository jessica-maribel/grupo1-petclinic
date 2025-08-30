#!groovy
pipeline {
  agent {
    docker {
      image 'maven:3.9.6-eclipse-temurin-17'  // imagen moderna
      args  '-u root:root -v /var/run/docker.sock:/var/run/docker.sock -v /var/jenkins_home:/var/jenkins_home'
    }
  }
  options { skipDefaultCheckout(false) }
  stages {
    stage('Maven Install') {
      steps {
        sh 'mvn spring-javaformat:apply'
        sh 'mvn io.spring.javaformat:spring-javaformat-maven-plugin:0.0.20:apply'
        sh 'whoami && java -version && mvn -v'
        sh 'mvn -B -DskipTests clean package'
      }
    }
    stage('Docker Build') {
      steps {
        sh 'docker --version'
        sh 'docker build -t grupo01/spring-petclinic:latest .'
      }
    }
  }
}
