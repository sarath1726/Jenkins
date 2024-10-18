pipeline {
    agent { docker { image 'jenkins-python' } }

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
                    /opt/venv/bin/robot --outputdir results robot_tests
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
