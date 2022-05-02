    pipeline {
        agent any
            environment {
            registry = 'rajubothra/devopsb22'
            registryCredential = 'dockerhub_id'
            dockerImage = ''
        }
        stages {
            stage('Build Java Code') {
                steps {
                    echo "${BUILD_NUMBER}"
                    sh 'rm -f ROOT.war && bash build.sh && mv ROOT.war ROOT${BUILD_NUMBER}'
                }
            }
            stage('send to s3') {
                steps {
                    s3Upload consoleLogLevel: 'INFO', dontSetBuildResultOnFailure: false, dontWaitForConcurrentBuildCompletion: false, entries: [[bucket: 'rajubxyz', excludedFile: '', flatten: false, gzipFiles: false, keepForever: false, managedArtifacts: false, noUploadOnFailure: true, selectedRegion: 'us-east-1', showDirectlyInBrowser: false, sourceFile: '*.war', storageClass: 'STANDARD', uploadFromSlave: false, useServerSideEncryption: false]], pluginFailureResultConstraint: 'FAILURE', profileName: 'jenkins-s3-full-access-prod-slave', userMetadata: []
                }
            }
            stage('Docker Image') {
                steps {
                    script {
                    
                dockerImage = docker.build registry + ":$BUILD_NUMBER"
                    }
                }   
            }
             stage('Push Docker Image') {
                steps {
                    script {
                    
                docker.withRegistry('', registryCredential){
                    }
                }   
            }
        }
         stage('Perform Packer Build') {
          
            steps {
                    sh 'pwd'
                    sh 'ls -al'
                    sh 'packer build -var-file packer-vars.json packer.json | tee output.txt'
                    sh "tail -2 output.txt | head -2 | awk 'match(\$0, /ami-.*/) { print substr(\$0, RSTART, RLENGTH) }' > ami.txt"
                    sh "echo \$(cat ami.txt) > ami.txt"
                    script {
                        def AMIID = readFile('ami.txt').trim()
                        sh 'echo "" >> variables.tf'
                        sh "echo variable \\\"imagename\\\" { default = \\\"$AMIID\\\" } >> variables.tf"
                    }
            }
        }
 
    }
}
