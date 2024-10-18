pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/sarath1726/Jenkins.git'
        ROBOT_TESTS_DIR = 'robot_tests'  // Directory where your Robot Framework tests are located
    }
    stages {
        stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }
        stage('Run Robot Framework Tests') {
            steps {
                echo 'Running Robot Framework tests...'
                sh '''
                    robot $ROBOT_TESTS_DIR
                '''
            }
        }
    }
    
    post {
        always {
            echo 'Cleaning up and archiving results...'
            archiveArtifacts artifacts: '**/output.xml', allowEmptyArchive: true
            junit '**/output.xml'
        }
    }
}
