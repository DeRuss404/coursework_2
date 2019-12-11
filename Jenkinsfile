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
		stage('sonarqube Test') {
		environment {
			scannerHome = tool 'sonarqubescanner'
		}
		agent {
			docker {
				image 'node:6-alpine' 
				args '-p 3000:3000' 
			}
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
		stage('Docker package') {
		steps {
			sh 'echo package'
		}
		}
		stage('Docker push') {
		steps {
			sh 'echo push'
		}
		}
    }
}