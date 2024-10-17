pipeline
{
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Checkout the main branch
                git branch: 'main', url: 'https://github.com/sarath1726/Jenkins.git'
            }
        }
        
	    stage('Activate Virtual Environment and Run Tests') {
            steps {
                // Activate the virtual environment and run Robot Framework tests
                script {
                    // Activate the virtual environment
                    def activateScript = 'source venv/bin/activate &&'

                    // Run Robot Framework tests
                    sh "${activateScript} robot --outputdir results robot_tests"
                }
            }
        }
    }

    post {
        always {
            // Publish Robot Framework results
            robot outputPath: 'results'
        }
    }
}
