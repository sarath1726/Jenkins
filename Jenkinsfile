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

                            pip list
                            # Run Robot Framework tests
                            robot --outputdir results robot_tests
                        else
                            echo "Virtual environment not found."
                            exit 1
                        fi
                    '''
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


    

