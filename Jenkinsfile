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
            script {
                // Activate the existing virtual environment
                sh '''
                source Jenkins/venv/bin/activate
                '''
        }
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
