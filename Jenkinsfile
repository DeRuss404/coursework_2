pipeline {
    agent any
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