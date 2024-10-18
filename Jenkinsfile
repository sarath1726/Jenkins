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
                        
                            source venv/bin/activate
                            pip install --upgrade pip
                            pip install robotframework pytest
                            
                            echo "Virtual environment activated."

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


    

