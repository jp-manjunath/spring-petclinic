#!groovy
pipeline {
  agent none
  stages {
//	 stage('Checkout') {
//            steps {
//                git branch: 'main', url: 'https://github.com/jp-manjunath/spring-petclinic.git'
//            }
//        }
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.5.0'
        }
      }
      steps {
        sh 'mvn clean install'
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t manjunathjp245/spring-petclinic:${env.BUILD_NUMBER} .'
      }
    }
  }
}