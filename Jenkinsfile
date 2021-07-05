#!/usr/bin/env groovy

pipeline {
    agent any

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
                sh(script: 'java -jar target/dependency/webapp-runner.jar target/*.war')
            }
        }
    }
}
