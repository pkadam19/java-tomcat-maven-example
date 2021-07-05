#!/usr/bin/env groovy

pipeline {
    agent any

    environment {
        MAVEN_HOME = tool name: 'maven-3.3.9', type: 'maven'
        ENV_JOB_NAME = 'tomcat-apache'
    }

    stages {
        stage('Add Maven') {
            steps {
                sh "export PATH=\$PATH:${MAVEN_HOME}/bin"
            }
        }
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
