// pipeline {
//     agent any
//     environment {
//          RP_ENDPOINT = "http://localhost:8080"                                                             // Replace with your ReportPortal URL
//          RP_API_KEY = "new_cJJoY2SeT-G0xisUrarxZ_8OJOub_LretZj0xcMK7iTf1sVk7O2yoPFE0oEWqh5r"               // Replace with your ReportPortal API key
//          RP_PROJECT = "superadmin_personal"                                                                // Replace with your project name
//          RP_LAUNCH = "Robot Framework Launch"                                                              // Specify a name for your launch
//     }
    
//     stages {
//         stage('Clone Repository') {
//             steps {
//                 // Replace the following URL with the URL of your public Git repository
//                 git url: 'https://github.com/openbmc/openbmc-test-automation.git', branch: 'main'
//             }
//         }
//         stage('Create a Python Virtual Environment') {
//             steps {
//                 // Create and activate virtual environment
//                 sh '''
//                     python3 -m venv myenv        
//                     . myenv/bin/activate
//                     pip install --upgrade pip
//                     pip install -r requirements.txt
//                 '''
//             }
//         }
//         stage('Activate the Virtual Environment and Execute the Test') {
//             steps {
//                 sh '''
//                     . myenv/bin/activate
//                     pip install robotframework-reportportal
//                     pip install robotframework-xml

                    
//                     # Debug paths
//                     echo "Listing OpenBMC Test Automation directory:"
//                     ls
//                     echo "Current Directory $(pwd)"
                    
//                     # Run Robot Framework tests with ReportPortal listener
//                     #robot --listener robotframework_reportportal.listener \
//                     #    --variable RP_ENDPOINT:{RP_ENDPOINT} \
//                     #    --variable RP_API_KEY:{RP_API_KEY} \
//                     #    --variable RP_PROJECT:{RP_PROJECT} \
//                     #    --variable RP_LAUNCH:"{RP_LAUNCH}" \
//                     #    -v OPENBMC_HOST:172.20.194.31 \
//                     #    -v OPENBMC_USERNAME:chetan.gubbi \
//                     #    -v OPENBMC_PASSWORD:Krutrim@234 \
//                     #    -v MANAGER_ID:1 \
//                     #    -v CHASSIS_ID:1 \
//                     #    -v SYSTEM_ID:s \
//                     #    -v IPMI_USERNAME:chetan.gubbi \
//                     #    templates/test_openbmc_setup.robot
       
//                     # Run Robot Framework tests
//                     robot --listener robotframework_reportportal.listener \
//                         --variable RP_ENDPOINT:"http://localhost:8080" \
//                         --variable RP_API_KEY:"RP-API-key_gPAnpyjORxytDIs0LAkLhtGDRX2JOUp9KAPzCo7wFx1No2CJEGRSIZH5vdOaaEcy" \
//                         --variable RP_PROJECT:"superadmin_personal" \
//                         --variable RP_LAUNCH:"Robot Framework Launch" \
//                         templates/test_openbmc_setup.robot --reportportal

   
//                 '''
//             }
//         }
//     }
        
//     post {
//         always {
//             echo 'This will always run, even if the build fails.'
//         }
//         success {
//             echo 'Pipeline completed successfully.'
//         }
//         failure {
//             echo 'Test execution failed.'
//         }
//     }
// }
pipeline {
    agent any
    environment {
         RP_ENDPOINT = "http://localhost:8080"                                                             // Replace with your ReportPortal URL
         RP_API_KEY = "new_cJJoY2SeT-G0xisUrarxZ_8OJOub_LretZj0xcMK7iTf1sVk7O2yoPFE0oEWqh5r"               // Replace with your ReportPortal API key
         RP_PROJECT = "superadmin_personal"                                                                // Replace with your project name
         RP_LAUNCH = "Robot Framework Launch"                                                              // Specify a name for your launch
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the GitHub repository
                git 'https://github.com/your_user/your_repo.git'
            }
        }
        
        stage('Set Up Environment') {
            steps {
                script {
                    // Set up Python environment (assuming it's a virtual environment)
                    sh '''
                        python3 -m venv myenv
                        . myenv/bin/activate
                        pip install -r requirements.txt'
                    '''
                }
            }
        }
        
        stage('Run Robot Framework Tests') {
            steps {
                script {
                    // Run the Robot Framework test with ReportPortal listener
                    sh ''''
                        . myenv/bin/activate
                        robot --listener robotframework_reportportal.listener -d results tests/test_suite.robot'
                    '''
                }
            }
        }

        stage('Publish Results to ReportPortal') {
            steps {
                script {
                    // Example for using ReportPortal listener directly
                    sh '''
                        . myenv/bin/activate
                        robot --listener robotframework_reportportal.listener -d results tests/test_suite.robot'
                    '''
                }
            }
        }
    }

    post {
        always {
            // Clean up or send notifications, if needed
        }
    }
}
