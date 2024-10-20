pipeline {
    agent any

    environment {
        // Define environment variables if needed
        VENV_PATH = 'venv'  // Path to the virtual environment
        TESTS_DIR = 'robot_tests'  // Path to the directory containing Robot test cases
        RESULTS_DIR = 'robot_tests/results'  // Directory where test results will be stored
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository (done automatically by Jenkins when job is set up with Git)
                git branch: 'main', url: 'https://github.com/sarath1726/Jenkins.git'
            }
        }

        stage('Activate Virtual Environment and Run Robotframework Scripts') {
            steps {
                // Create results directory
                sh 'mkdir -p robot_tests/results'
                // Activate the virtual environment and Run Tests
                sh'''
                . /venv/bin/activate
                robot --outputdir robot_tests/results robot_tests  # Run Robot Framework tests
                '''
            }
        }


        stage('Publish Robot Framework Results') {
            steps {
                // Publish the results
                robot outputPath: robot_tests/results
            }
        }
    }

    post {
        always {
            // Archive the test reports
            archiveArtifacts artifacts: 'robot_tests/results/*.xml, robot_tests/results/*.html', allowEmptyArchive: true
        }
        success {
            echo 'Tests executed successfully.'
        }
        failure {
            echo 'Test execution failed.'
        }
    }
}
