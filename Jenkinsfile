pipeline {
	agent any
	environment {
        CI = 'true' 
    }
    stages {
        stage('Build') {
            steps {
				sh 'echo "agent {docker {image 'node 6-alpine' args ' - p 3000 3000' }}"'
				sh 'echo "Placeholder Build"'
            }
        }
		stage('Sonarqube Test') {
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
		stage('Docker package') {
		steps {
			sh 'echo "placeholder package"'
		}
		}
		stage('Docker push') {
		steps {
			sh 'echo "placeholder push"'
		}
		}
    }
}