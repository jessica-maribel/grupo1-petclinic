#!groovy
pipeline {
  agent any

  stages {
    stage('Diagnóstico') {
      steps {
        sh 'whoami && id && pwd'
        sh 'docker version'
      }
    }

    stage('Maven Build (docker run)') {
      steps {
        sh '''
          echo "PWD=$PWD"
          docker run --rm -u 0:0 \
            -v jenkins_home:/jenkins \
            -w /jenkins/workspace/spring-petclinic-docker \
            maven:3.9.6-eclipse-temurin-17 \
            mvn -U clean package -DskipTests -Dcheckstyle.skip=true -B -Dmaven.repo.local=/jenkins/.m2/repository

          ls -la target || true
        '''
      }
    }

    stage('Docker Build') {
      steps {
        sh 'docker build -t petclinic:latest .'
      }
    }
  }
}

