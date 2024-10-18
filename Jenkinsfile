pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the main branch
                git branch: 'main', url: 'https://github.com/sarath1726/Jenkins.git'
            }
        }
        stage('Setup Virtual Environment') {
            steps {
                // Create and activate the virtual environment, and install Robot Framework
                sh '''
                #!/bin/bash
                Jenkins/venv/bin/python3 -m venv venv  # Create virtual environment if it doesn't exist
                . venv/bin/activate  # Activate the virtual environment
                pip install robotframework  # Install Robot Framework
                '''
            }
        }
        stage('Run Robot Tests') {
            steps {
                // Run Robot Framework tests
                sh '''
                #!/bin/bash
                . venv/bin/activate  # Activate the virtual environment
                robot --outputdir results robot_tests
                '''
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
