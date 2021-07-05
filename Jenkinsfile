pipeline {
    agent slave1

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
                sh '''
                    mvn clean package
                '''
            }
        }

        stage('Test') {
            steps {
                echo 'Testing.....'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying...'
        }

    }

}
