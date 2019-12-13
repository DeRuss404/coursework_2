pipeline {
	agent any
	environment {
        CI = 'true' 
    }
    stages {
		stage('Clone repo') {
		steps {
			checkout scm
			sh 'echo "Repo Cloned"'
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
		stage('Docker build and push image') {
		steps {
			script{
				app = docker.build("deruss404/coursework_2")
				sh 'echo "Docker image built"'
			
				docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
				app.push("${env.BUILD_NUMBER}")
				app.push("latest")
				}
				
				sh 'echo "placeholder push"'
			}
		}
		}
		stage('Deployment') {
		steps {
				sh 'ssh -t azureuser@13.94.29.195 kubectl set image deployments/coursework_2 coursework_2=deruss404/coursework_2:late'
			}
		}
		}
    }