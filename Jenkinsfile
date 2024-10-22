pipeline {
    agent any
    environment {
        RP_ENDPOINT = 'http://localhost:8080'
        RP_API_KEY = 'Rp-api)key_4CzxOegrT6eOr6EclV1haMDvH2O9PQq4Jgl8Y84WNvb4CFmlrpfMYDZdJfXY_uaa'
        RP_PROJECT = 'superadmin_personal'
        RP_LAUNCH = 'Robot Framework Launch'
    }
    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        } 
        
        stage('Run Robot Framework Tests') {
            steps {
                // Setup and Activate virtual environment and run the tests
                sh '''
                    python3 -m venv venv
                    . venv/bin/activate
                    pip install robotframework
                    pip install robotframework-requests 
                    pip install robotframework-reportportal
                    echo "Current Directory $(pwd)"
                    mkdir -p results
                    # Run Robot Framework tests with ReportPortal listener
                    #robot --listener robotframework_reportportal.listener \
                    #      --variable RP_ENDPOINT:"${RP_ENDPOINT}" \
                    #      --variable RP_API_KEY:"${RP_API_KEY}" \
                    #      --variable RP_PROJECT:"{$RP_PROJECT}" \
                    #      --variable RP_LAUNCH:"${RP_LAUNCH}" \
                    #      ./robot_tests
                    robot --outputdir results robot_tests
                '''
            }
        }
        stage('Publish Robot Framework Results') {
            steps {
                // Publish the results
                robot outputPath: "./results"
            }
        }
        stage('Push Results to GitHub') {
            steps {
                // Add Robot result files to Git
                sh """
                    git config user.email "sarathas907@gmail.com"
                    git config user.name "sarath1726"
                    git add results/output.xml results/report.html results/log.html
                    git commit -m "Add Robot Framework test results"
                    git push origin main
                """
            }
        }
    }
        
    post {
        always {
            echo 'Cleaning up workspace...'
            cleanWs()  // Cleans up the workspace after the pipeline execution
        }
        success {
            echo 'Tests executed successfully.'
        }
        failure {
            echo 'Test execution failed.'
        }
    }
