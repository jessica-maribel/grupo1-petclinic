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
          sh 'mvn -U clean package -DskipTests -Dcheckstyle.skip=true'
       }  
     }
 }
}

