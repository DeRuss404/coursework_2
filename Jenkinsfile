pipeline {
	agent any
	environment {
        CI = 'true' 
    }
    stages {
		stage('Sonarqube Test') {
		environment {
			scannerHome = tool 'sonarqubescanner'
		}
		steps {
			withSonarQubeEnv('sonarqube') {
			sh "${scannerHome}/bin/sonar-scanner"
        }
		}
		}
		stage('Docker build package') {
		steps {
			sh 'echo "placeholder package"'
		}
		}
		stage('Docker push package') {
		steps {
			sh 'echo "placeholder push"'
		}
		}
    }
}