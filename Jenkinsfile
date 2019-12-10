pipeline {
        agent {
			docker {
				image 'node:6-alpine' 
				args '-p 3000:3000' 
			}
		}
         stages {
                 stage('Build Phase') {
				 steps {
					sh 'npm install' 
				 }
                 }
                 stage('Test Phase') {
                 steps {
                    input('Do you want to proceed?')
                 }
                 }
                 stage('Packaging Phase') {
                 when {
                       not {
                            branch "master"
                       }
                 }
                 steps {
                       echo "Hello"
                 }
                 }
                 stage('End Push, DockerHub') {
                 parallel { 
                            stage('Unit Test') {
                           steps {
                                echo "Running the unit test..."
                           }
                           }
                            stage('Integration test') {
                              agent {
                                    docker {
                                            reuseNode true
                                            image 'ubuntu'
                                           }
                                    }
                              steps {
                                echo "Running the integration test..."
                              }
                           }
                           }
                           }
              }
}