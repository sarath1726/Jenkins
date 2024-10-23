pipeline {
    agent any
    environment {
        RP_ENDPOINT = "http://traefik:8080"       // Replace with your ReportPortal URL
        RP_API_KEY = "ReportPortal-Token_0ZYhiSVKR16XA75kbiZBypisG0Kx3q4w3nVd6ZtxmQ-XDVeByOfMF1WwX1Ox3NQr"   // Replace with your ReportPortal API key
        RP_PROJECT = "superadmin_personal"          // Replace with your project name
        RP_LAUNCH = "Robot Framework Launch"        // Specify a name for your launch
    }
    parameters {
        string(name: 'TEST_DIR', defaultValue: 'robot_tests', description: 'Directory containing the Robot Framework test cases')
    }
    
    stages {
        stage('Checkout SCM') {
            steps {
                checkout scm
            }
        } 

        stage('List Test Cases') {
            steps {
                // List all Robot Framework test case files in the specified directory
                sh 'find ${TEST_DIR} -name "*.robot"'
            }
        }
        
        stage('Run Robot Framework Tests') {
            steps {
                // Setup and Activate virtual environment and run the tests
                sh '''
                    #!/bin/bash
                    
                    python3 -m venv venv
                    . venv/bin/activate
                    pip install robotframework
                    pip install robotframework-requests 
                    pip install robotframework-reportportal
                    echo "Current Directory $(pwd)"
                    
                    mkdir -p ${params.TEST_DIR}/results
                    # mkdir -p results
                    
                    # Run Robot Framework tests with ReportPortal listener
                    robot --listener robotframework_reportportal.listener \
                          --variable RP_ENDPOINT:"http://traefik:8080" \
                          --variable RP_API_KEY:"ReportPortal-Token_0ZYhiSVKR16XA75kbiZBypisG0Kx3q4w3nVd6ZtxmQ-XDVeByOfMF1WwX1Ox3NQr" \
                          --variable RP_PROJECT:"superadmin_personal" \
                          --variable RP_LAUNCH:"Robot Framework Launch" \
                          # --outputdir ./results .
                          --outputdir ${params.TEST_DIR}/results \
                          ${params.TEST_DIR}
                    
                    # robot --outputdir results robot_tests
                '''
            }
        }
        
        stage('Publish Robot Framework Results') {
            steps {
                // Publish the results
                // robot outputPath: "./results"
                robot outputPath: "${params.TEST_DIR}/results"
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
}
