#!groovy
pipeline {
  agent any
  options {
        skipStagesAfterUnstable()
    }
   tools {
        maven 'Maven' // This should match the name configured in "Global Tool Configuration"
        dockerTool 'Docker'
    }
  stages {
//	 stage('Checkout') {
//            steps {
//                git branch: 'main', url: 'https://github.com/jp-manjunath/spring-petclinic.git'
//            }
//        }
stage('Check Docker') {
      steps {
        sh 'docker --version'
      }
    }
    stage('Maven Install') {
      steps {
        sh 'mvn clean install'
      }
    }
    stage('Docker Build') {
      steps {
		sh 'docker --version'
        sh "docker build -t manjunathjp245/spring-petclinic:${env.BUILD_NUMBER} ."
      }
    }
//    stage('Docker Push') {
//      agent any
//      steps {
//        withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
//          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
//          sh 'docker push manjunathjp245/spring-petclinic:latest'
//        }
//      }
//  }
  
  stage('Docker Push') {
  steps {
    withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
      sh "echo $dockerHubPassword | docker login -u $dockerHubUser --password-stdin"
      sh "docker push xxxxxx/spring-petclinic:${env.BUILD_NUMBER}"
    }
  }
}

 } 
  
}