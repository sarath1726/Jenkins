pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }

        stage('Run Robot Framework Tests') {
            steps {
                // Run the robot tests using the full path to the robot binary
                sh '''
                    robot --outputdir results robot_tests
                '''
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
