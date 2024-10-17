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

        stage('Run Robot Framework Tests and Update Results in ReportPortal') {
            steps {
		sh 'source venv/bin/activate'
                // Create results directory and run tests
                sh 'mkdir -p results'
                // sh 'robot --outputdir results robot_tests'
                sh 'robot --outputdir results robot_tests'
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
