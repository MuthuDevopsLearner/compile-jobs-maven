pipeline {
    agent any
 
   //tools
    //{
     //  maven "Maven"
    //}
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'master', url: 'https://github.com/MuthuDevopsLearner/compile-jobs-maven.git'
             
          }
        }
  stage('Execute Maven') {
           steps {
             
                sh 'mvn package'             
          }
        }
stage('Docker Build and Tag') {
           steps {
                sh 'docker images'
                sh 'docker build -t addressbookapp:v1 .' 
                sh 'docker tag addressbookapp:v1 muthudevopslearner/addressbook:v1'
                //sh 'docker tag addressbookapp muthudevopslearner/addressbook:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
                   //withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
                withCredentials([usernamePassword(
                        credentialsId: "DockerHub", // Credential Id that should be created at Jenkins Server...
                        usernameVariable: env.DOCKERHUB_CREDENTIALS_USR, // Credential Username that should be created at jenkins Server.
                        passwordVariable: env.DOCKERHUB_CREDENTIALS_PSW, // Credential Password that shoud be created at Jenkins Server..
                    )]){
                        sh "docker login -u ${env.DOCKERHUB_CREDENTIALS_USR} -p ${env.DOCKERHUB_CREDENTIALS_PSW}"
                        sh "echo 'Logged In.. Into Docker.'"
                   sh  'docker push muthudevopslearner/addressbook:v1'
                   //  sh  'docker push muthudevopslearner/addressbook:$BUILD_NUMBER' 
                }   }  
                   }
              }
     }
 }
