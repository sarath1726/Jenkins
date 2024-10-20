pipeline {
    agent any

    environment {
        // Define environment variables if needed
        VENV_PATH = './venv'  // Path to the virtual environment
        TESTS_DIR = './robot_tests'  // Path to the directory containing Robot test cases
        RESULTS_DIR = './robot_tests/results'  // Directory where test results will be stored
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository (done automatically by Jenkins when job is set up with Git)
                git url: 'https://github.com/sarath1726/Jenkins.git', branch: 'main'
            }
        }

        stage('Activate Virtual Environment and Install Dependencies') {
            steps {
                // Create results directory
                sh 'mkdir -p $RESULTS_DIR'

                // Activate the virtual environment and ensure robotframework is installed
                sh '''
                . $VENV_PATH/bin/activate
		 python -m pip install -r requirements.txt
                '''
            }
        }

        stage('Run Robot Framework Tests') {
            steps {
                // Activate the virtual environment and run robot tests
                sh '''
                . $VENV_PATH/bin/activate
                robot --outputdir $RESULTS_DIR $TESTS_DIR
                '''
            }
        }


        stage('Publish Robot Framework Results') {
            steps {
                // Publish the results
                robot outputPath: RESULTS_DIR
            }
        }
    }

    post {
        always {
            // Archive the test reports
            archiveArtifacts artifacts: '$RESULTS_DIR/*.xml, $RESULTS_DIR/*.html', allowEmptyArchive: true
        }
        success {
            echo 'Tests executed successfully.'
        }
        failure {
            echo 'Test execution failed.'
        }
    }
}
