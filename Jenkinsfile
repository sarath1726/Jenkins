pipeline {
    agent any
       stages {
        stage('Checkout') {
            steps {
                // Checkout the main branch
                git branch: 'main', url: 'https://github.com/sarath1726/Jenkins.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                // Install Python3, pip, and Robot Framework
                sh 'apt-get update && apt-get install -y python3-pip'
                sh 'pip3 install robotframework robotframework-reportportal'
            }
        }

        stage('Run Robot Framework Tests') {
            steps {
                // Use the `sh` step to run shell commands
                sh 'robot --listener robotframework_reportportal.listener --outputdir results robot_tests'
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
