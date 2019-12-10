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
				sh 'echo "node ./server.js"'
            }
        }
		stage('sonarqube') {
		agent {
			docker {
			image 'java:8-alpine'
			args '-p 4000:4000'
			}
		}
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