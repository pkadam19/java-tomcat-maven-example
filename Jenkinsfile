#!/usr/bin/env groovy

pipeline {
    agent {
      node {
        label 'Slave 1'
      }
    }    

    environment {
        ENV_JOB_NAME = 'tomcat-apache'
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh "mvn clean package"
                
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                //sh(script: 'java -jar target/dependency/webapp-runner.jar target/*.war')
                sshagent(['jenkins-master-slave-private-key']) {
                    sh 'ssh -o StrictHostKeyChecking=no afour@192.168.16.200'
                    sh 'ssh -v afour@192.168.16.200'
                    sh '''
                        cp -r . /site/
                        java -jar target/dependency/webapp-runner.jar target/*.war
                    ''' 
                }
            }
        }
        
    }
}
