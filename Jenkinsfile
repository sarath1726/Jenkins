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
                mkdir -p results
                . venv/bin/activate
                robot --outputdir results robot_tests
                '''
            }
        }

        stage('Publish Robot Results') {
            steps {
                // Publish the Robot Framework test results
                robot plugin: 'Robot Framework', outputPath: "results"
            }
        }
    }

    post {
        always {
            junit allowEmptyResults: true, testResults: "results/output.xml"
        }
    }
}
