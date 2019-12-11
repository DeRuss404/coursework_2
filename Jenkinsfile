pipeline {
	agent any
	environment {
        CI = 'true' 
    }
    stages {
		stage('Docker build package') {
		steps {
			sh 'echo "placeholder package"'
			def app = docker.build("coursework")
		}
		}
		stage('Sonarqube Test') {
		environment {
			scannerHome = tool 'sonarqubescanner'
		}
		steps {
			withSonarQubeEnv('sonarqube') {
			sh "${scannerHome}/bin/sonar-scanner"
			sleep(10)
        }
			timeout(time: 10, unit: 'MINUTES') {
			waitForQualityGate abortPipeline: true
        }
		}
		}
		stage('Docker push package') {
		steps {
			sh 'echo "placeholder push"'
		}
		}
    }
}