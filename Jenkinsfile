pipeline {
    agent any

    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        }
        stage('Activate Virtual Environment and Run Tests') {
            steps {
                script {
                    // Activate the virtual environment and run the tests
                    sh '''
                        # Activate the virtual environment
                        source venv/bin/activate
                        
                        # Verify the virtual environment is activated
                        which robot

                        # Run the tests
                        robot --outputdir results robot_tests
                    '''
                }
            }
        }
    }
}
        '''
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
'''
