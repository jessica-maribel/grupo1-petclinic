#!groovy
pipeline {
 agent none
 stages {
     stage('Maven Install') {
         agent {
             docker {
                 image 'maven:3.5.0'
             }
         }
         steps {
            sh 'mvnw spring-javaformat:apply'
            sh 'mvnw io.spring.javaformat:spring-javaformat-maven-plugin:0.0.20:apply'
            sh 'mvn clean install'
         }    
     }
     stage('Docker Build') {
         agent any
         steps {
             sh 'docker build -t grupo01/spring-petclinic:latest .'
         }
     }
 }
}

