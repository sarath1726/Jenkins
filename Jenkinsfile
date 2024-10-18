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
                // Run Robot Framework tests
                
                #!/bin/bash
                sh 'mkdir -p results'
                sh 'robot --outputdir results robot_tests'
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
