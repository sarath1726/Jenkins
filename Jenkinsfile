pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/sarath1726/Jenkins.git'
        ROBOT_TESTS_DIR = 'robot_tests'  // Directory where your Robot Framework tests are located
    }
    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning repository...'
                git url: "$REPO_URL"
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
