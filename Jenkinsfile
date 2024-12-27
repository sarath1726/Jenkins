pipeline {
    agent any
    // environment {
    //     RP_ENDPOINT = "http://localhost:8080"                                                             // Replace with your ReportPortal URL
    //     RP_API_KEY = "new_cJJoY2SeT-G0xisUrarxZ_8OJOub_LretZj0xcMK7iTf1sVk7O2yoPFE0oEWqh5r"               // Replace with your ReportPortal API key
    //     RP_PROJECT = "superadmin_personal"                                                                // Replace with your project name
    //     RP_LAUNCH = "Robot Framework Launch"                                                              // Specify a name for your launch
    // }

    stages {
        stage('Clone Repository') {
            steps {
                // Replace the following URL with the URL of your public Git repository
                git url: 'https://github.com/openbmc/openbmc-test-automation.git', branch: 'master'
            }
        }
        stage('Create a Python Virtual Environment') {
            steps {
                // Create and activate virtual environment
                sh '''
                    python3 -m venv myenv        
                    . myenv/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }
        stage('Activate the Virtual Environment and Execute the Test') {
            steps {
                sh '''
                    . myenv/bin/activate
                    
                    # Debug paths
                    echo "Listing OpenBMC Test Automation directory:"
                    ls
                    echo "Current Directory $(pwd)"
                    python update_bmc_ssh_utils.py
                    
                    # Run Robot Framework tests with ReportPortal listener
                    #robot --listener robotframework_reportportal.listener \
                    #    --variable RP_ENDPOINT:{RP_ENDPOINT} \
                    #    --variable RP_API_KEY:{RP_API_KEY} \
                    #    --variable RP_PROJECT:{RP_PROJECT} \
                    #    --variable RP_LAUNCH:"{RP_LAUNCH}" \
                    #    -v OPENBMC_HOST:172.20.194.31 \
                    #    -v OPENBMC_USERNAME:chetan.gubbi \
                    #    -v OPENBMC_PASSWORD:Krutrim@234 \
                    #    -v MANAGER_ID:1 \
                    #    -v CHASSIS_ID:1 \
                    #    -v SYSTEM_ID:s \
                    #    -v IPMI_USERNAME:chetan.gubbi \
                    #    templates/test_openbmc_setup.robot
       
                    # Run Robot Framework tests
                    robot -v OPENBMC_HOST:172.20.194.31 \
                          -v OPENBMC_USERNAME:chetan.gubbi \
                          -v OPENBMC_PASSWORD:Krutrim@234 \
                          -v MANAGER_ID:1 \
                          -v CHASSIS_ID:1 \
                          -v SYSTEM_ID:s \
                          -v IPMI_USERNAME:chetan.gubbi \
                          templates/test_openbmc_setup.robot     
                '''
            }
        }
    }
        
    post {
        always {
            echo 'This will always run, even if the build fails.'
        }
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Test execution failed.'
        }
    }
}
