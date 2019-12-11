pipeline {
	agent any
	environment {
        CI = 'true' 
    }
    stages {
        stage('Build') {
			agent {
				docker {
				image 'node:6-alpine' 
				args '-p 3000:3000' 
				}
			}
            steps {
                sh 'npm install' 
				sh 'npm version'
				sh 'ls'
				sh 'echo "node ./server.js"'
            }
        }
		stage('sonarqube') {
		environment {
			scannerHome = tool 'sonarqubescanner'
		}
		steps {
			withSonarQubeEnv('sonarqube') {
			sh "${scannerHome}/bin/sonar-scanner"
        }
			timeout(time: 10, unit: 'MINUTES') {
			waitForQualityGate abortPipeline: true
        }
		}
		}
    }
}