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
    stage('Maven Install') {
      steps {
        sh 'mvn clean install -DskipTests'
      }
    }
    stage('Docker Build') {
      steps {
		sh 'docker --version'
        // Build and tag with build number
        sh "docker build -t manjunathjp245/spring-petclinic:${env.BUILD_NUMBER} ."
        // Tag with 'latest'
        sh "docker tag manjunathjp245/spring-petclinic:${env.BUILD_NUMBER} manjunathjp245/spring-petclinic:latest"
      }
    }
  stage('Docker Push') {
  steps {
    withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
      sh "echo $dockerHubPassword | docker login -u $dockerHubUser --password-stdin"
      sh "docker push manjunathjp245/spring-petclinic:${env.BUILD_NUMBER}"
    }
  }
}

 } 
  
}