pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout the main branch
                git branch: 'main', url: 'https://github.com/sarath1726/Jenkins.git'
            }
        }
        stage('Setup Environment') {
            steps {
                script {
                    // Activate your virtual environment
                    sh '. ./venv/bin/activate'
                }
            }
        }
        stage('Run Robot Tests') {
            steps {
                // Run Robot Framework tests
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
