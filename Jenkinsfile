pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/sarath1726/Jenkins.git'
            }
        }
        stage('Run Robot Framework Tests') {
            steps {
                // Assuming you run tests here
                sh 'robot --outputdir results robot_tests'
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
