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
                    // Run the shell commands in a block
                        // Activate the virtual environment
                        sh '. venv/bin/activate'
                        
                        // Verify the virtual environment is activated
                        which python

                        // Run the Robot Framework tests
                        sh 'robot --outputdir results robot_tests'
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}


    

