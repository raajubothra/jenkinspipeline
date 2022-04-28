pipeline {
agent any
environment { 
   registry = "rajubothra/devops" 
    registryCredential = 'dockerhub_id' 
    dockerImage = ''

    stages {
    stage('Build') {
      steps {
        echo "${BUILD_NUMBER}"
        sh 'rm -f ROOT.war && bash build.sh && mv ROOT.war ROOT{BUILD_NUMBER}.war'
        sh 'ls -al'
      }
    }
    stage('Push to s3') {
      steps {
        s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'rajubxyz', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: true, selectedRegion: 'us-east-1', showDirectlyInBrowser: false, sourceFile: '*.war', storageClass: 'STANDARD_IA', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 'jenkins-s3-full-access-prod-slave', userMetadata: []
      }
    }
    stage('building docker image') {
      steps {
          script {
              
     dockerImage = docker.build registry + ":$BUILD_NUMBER" 
         }
      }
    }
  }     
}
