pipeline {
    agent any
   
 	stages {
        stage('Checkout') {
            steps {
                // Checkout the main branch
                git branch: 'main', url: 'https://github.com/sarath1726/Jenkins.git'
            }
        }
        stage('Run Robot Tests') {
            steps {
                // Activate the existing virtual environment and run Robot Framework tests
                sh '''
                #!/bin/bash
                source /opt/venv/bin/activate
                mkdir -p results
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

