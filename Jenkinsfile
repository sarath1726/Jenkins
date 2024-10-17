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
            script {
            // Create virtual environment if it doesn't exist
            if (!fileExists('venv')) {
                sh 'python3 -m venv venv'
            }
            // Activate the virtual environment
            sh 'source venv/bin/activate'
            // Run your tests here
            sh 'source venv/bin/activate && robot your_test_directory'
        }
    }
}
	    stage('Run Tests') {
            steps {
                script {
                    // Run Robot Framework tests
                    sh "robot --outputdir results robot_tests"
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
