#!/usr/bin/env groovy

pipeline {
    agent {
      node {
        label 'master'
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
               // sshagent(['jenkins-master-slave-private-key']) {
                sshagent(['abc70e48-8661-4fc6-9516-4780934dc053']) {
                    sh 'ssh -o StrictHostKeyChecking=no afour@192.168.16.155'
                    sh 'ssh -v afour@192.168.16.155'
                    sh '''
                        cp -r . /site/
                        //java -jar /site/target/dependency/webapp-runner.jar /site/target/*.war
                        sudo cp tomcat-apache.service /etc/systemd/system/
                        sudo systemctl daemon-reload
                        sudo systemctl enable tomcat.service
                        sudo systemctl start tomcat.service
                    ''' 
                }
            }
        }        
    }
    
    post {
        always {
            emailext body: '$DEFAULT_CONTENT', recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']], subject: '$DEFAULT_SUBJECT'
        }
    }  
}
