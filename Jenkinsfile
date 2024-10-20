pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/sarath1726/Jenkins.git'
            }
        }
        stage('Run Robot Tests') {
            steps {
                sh '''
                # Activate the virtual environment
                source venv/bin/activate
                # Run the Robot Framework tests
                robot --outputdir robot_tests/results robot_tests
                '''
            }
        }
        stage('Publish Results') {
            steps {
                robot outputPath: 'robot_tests/results'
            }
        }
    }
}
