pipeline {
    agent any

    environment {
        VENV_DIR = 'venv'          // Directory where the virtual environment is located
        ROBOT_TEST_DIR = 'robot_tests'  // Directory containing Robot Framework scripts
        OUTPUT_DIR = 'results'     // Directory to store the test results
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the same repository where Jenkinsfile is located
                git 'https://github.com/sarath1726/Jenkins.git'
            }
        }

        stage('Run Robot Tests') {
            steps {
                // Activate the existing virtual environment and run Robot Framework tests
                sh '''
                mkdir -p results
                . venv/bin/activate
                robot --outputdir results robot_tests
                '''
            }
        }

        stage('Publish Robot Results') {
            steps {
                // Publish the Robot Framework test results
                robot plugin: 'Robot Framework', outputPath: "results"
            }
        }
    }

    post {
        always {
            junit allowEmptyResults: true, testResults: "results/output.xml"
        }
    }
}
