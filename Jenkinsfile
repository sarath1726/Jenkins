pipeline {
    agent any
    environment {
        RP_ENDPOINT = "http://traefik:8080"       // Replace with your ReportPortal URL
        RP_API_KEY = "ReportPortal-Token_0ZYhiSVKR16XA75kbiZBypisG0Kx3q4w3nVd6ZtxmQ-XDVeByOfMF1WwX1Ox3NQr"   // Replace with your ReportPortal API key
        RP_PROJECT = "superadmin_personal"          // Replace with your project name
        RP_LAUNCH = "Robot Framework Launch"        // Specify a name for your launch
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
                
                    echo "RP_ENDPOINT: $RP_ENDPOINT"
                    echo "RP_API_KEY: $RP_API_KEY"
                    echo "RP_PROJECT: $RP_PROJECT"
                    echo "RP_LAUNCH: $RP_LAUNCH"
                    
                    python3 -m venv venv
                    . venv/bin/activate
                    pip install robotframework
                    pip install robotframework-requests 
                    pip install robotframework-reportportal
                    echo "Current Directory $(pwd)"
                    mkdir -p results
                    
                    # Run Robot Framework tests with ReportPortal listener
                    
                    robot --listener robotframework_reportportal.listener \
                          --variable RP_ENDPOINT:"http://treafik:8080" \
                          --variable RP_API_KEY:"ReportPortal-Token_0ZYhiSVKR16XA75kbiZBypisG0Kx3q4w3nVd6ZtxmQ-XDVeByOfMF1WwX1Ox3NQr" \
                          --variable RP_PROJECT:"superadmin_personal" \
                          --variable RP_LAUNCH:"Robot Framework Launch" \
                          --outputdir ./results robot_tests/add.robot
                    # robot --outputdir results robot_tests
                '''
            }
        }
        
        stage('Publish Robot Framework Results') {
            steps {
                // Publish the results
                robot outputPath: "./results"
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
