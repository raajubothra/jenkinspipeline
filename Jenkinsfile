pipeline {
    agent any 
    stages {
        stage('Build') { 
            steps {
               echo "${BUILD_NUMBER}"
               sh "rm -f ROOT.war && bash build.sh && mv ROOT.war ROOT{BUILD_NUMBER}.war"
               sh 'ls -al'
            }
        }

    }
}