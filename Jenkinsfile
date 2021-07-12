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
                // sh(script: 'java -jar target/dependency/webapp-runner.jar target/*.war')
                // sshagent(['jenkins-master-slave-private-key']) {
                sh "whoami"
                //                         pwd
                        // sudo cp -r . /site
                        // java -jar /site/target/dependency/webapp-runner.jar /site/target/*.war
                    //sshagent(['7580eb8c-f351-4f30-bb88-75ef4749414b']) {
                sshagent(['jenkins-master-slave-private-key']) {
                    sh 'ssh -o StrictHostKeyChecking=no afour@192.168.16.200'
                    sh 'ssh -v afour@192.168.16.200'
                    sh '''
                        whoami
                        pwd
                        hostnamectl
                        ifconfig
                        ls -ltr /site
                        sudo cp -r . /site/
                        ls -ltrh
                        sudo cp tomcat-apache.service /etc/systemd/system/
                        sudo systemctl daemon-reload
                        sudo systemctl enable tomcat-apache.service
                        sudo systemctl start tomcat-apache.service
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
