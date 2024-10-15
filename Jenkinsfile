'''
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
'''
pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Checkout the main branch
                git branch: 'main', url: 'https://github.com/sarath1726/Jenkins.git'
            }
        }
        stage('Run Robot Framework Tests') {
            steps {
                // Assuming you run tests here
                sh 'robot --outputdir results test_script.robot'
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

