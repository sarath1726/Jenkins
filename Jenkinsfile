pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Checkout source code from your repository
                git url: 'https://github.com/sarath1726/Jenkins.git'
            }
        }

        stage('Run Robot Framework Tests') {
            steps {
                // Run Robot Framework tests and store results in a directory
                sh 'robot --outputdir results /home/sarathbabu/Jenkins/robot_tests'
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

