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
                    // Activate your virtual environment and run commands within it
                    sh '''
                    source ./venv/bin/activate
                    '''
                }
            }
        }
        stage('Run Robot Tests') {
            steps {
                script {
                    // Create results directory and run Robot Framework tests
                    sh '''
                    mkdir -p results
                    robot --outputdir results robot_tests
                    '''
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
