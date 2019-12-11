node {
	agent any
	environment {
        CI = 'true' 
    }
		stage('Clone repo') {
		steps {
			checkout scm
			sh 'echo "Repo Cloned"'
		}
		}
		stage('Docker build image') {
		steps {
			app = docker.build("DeRuss404/coursework_2")
			sh 'echo "Docker image built"'
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
		stage('Docker push image') {
		steps {
			docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
			}
			sh 'echo "placeholder push"'
		}
		}
    }