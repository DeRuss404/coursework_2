pipeline {
    agent {
        docker {
            image 'node:6-alpine' 
            args '-p 3000:3000' 
        }
    }
	environment {
        CI = 'true' 
    }
    stages {
        stage('Build') { 
            steps {
                sh 'npm install' 
				sh 'npm version'
				sh 'ls'
				sh 'node ./server.js'
            }
        }
		stage('Test') {
			steps {
				sh './jenkins/scripts/test.sh'
			}
		}
		stage('PackagePush') {
			steps {
				echo "annoying declaritive programming"
			}
		}
    }
}