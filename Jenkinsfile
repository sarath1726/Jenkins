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
                    sh '''
                    # Run the shell commands in a block
                        # Activate the virtual environment
                        # Check if the venv directory exists
                        if [ -d "venv" ]; then
                            . venv/bin/activate
                            echo "Virtual environment activated."
                        else
                            echo "Virtual environment not found."
                            exit 1
                        fi
                    '''

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


    

