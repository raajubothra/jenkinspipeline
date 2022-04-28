pipeline {
    agent any
        environment {
        registry = "YourDockerhubAccount/YourRepository" 
        registryCredential = 'dockerhub_id' 
        dockerImage = '' 

    }
    stages { 
        stage('Build Java Code') {
            steps {
                echo "${BUILD_NUMBER}"
                sh "rm -f *.war && bash build.sh && mv ROOT.war ROOT${BUILD_NUMBER}"
            }
        }
        stage('Push to S3') { 
            steps {
                s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'rajubxyz', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: true, selectedRegion: 'us-east-1', showDirectlyInBrowser: false, sourceFile: '*.war', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 'jenkins-s3-full-access-prod-slave', userMetadata: []
            }
        }
        stage('Build Docker Image') {
            steps {
                script {

                    docker.withRegistry( '', registryCredential ) { 

                    dockerImage.push() 
                }
            }
       
        }
    }
}
}
