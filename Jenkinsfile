pipeline {
    agent any
    // environment {
    //     RP_ENDPOINT = "http://localhost:8080"                                                                // Replace with your ReportPortal URL
    //     RP_API_KEY = "Report-Portal_wPToRq9CQ0aQly950BPg2ENMbYM20DVgtyfVUjx502lpjxyyg3B9WuFY80D8vpiN"        // Replace with your ReportPortal API key
    //     RP_PROJECT = "superadmin_personal"                                                                   // Replace with your project name
    //     RP_LAUNCH = "Robot Framework Launch"                                                                 // Specify a name for your launch
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
                    python --version
                    pip install --upgrade pip
                    pip install -r requirements.txt

                    import re
                    # Path to the file
                    file_path = "lib/bmc_ssh_utility.py"
                    
                    # Old and new prompt values
                    old_prompt = "# "
                    new_prompt = "r12spd:~$"
                    
                    def update_prompt(file_path, old_prompt, new_prompt):
                        try:
                            with open(file_path, 'r') as file:
                                content = file.read()
                    
                            # Regular expression to find the prompt definition
                            pattern = r'"prompt":\s*["\']{}["\']'.format(re.escape(old_prompt))
                            replacement = f'"prompt": "{new_prompt}"'
                    
                            # Replace the old prompt with the new one
                            updated_content = re.sub(pattern, replacement, content)
                    
                            with open(file_path, 'w') as file:
                                file.write(updated_content)
                    
                            print(f"Successfully updated prompt in {file_path}.")
                        except FileNotFoundError:
                            print(f"Error: File not found - {file_path}")
                        except Exception as e:
                            print(f"An error occurred: {e}")
                    
                    # Update the prompt in the file
                    update_prompt(file_path, old_prompt, new_prompt)
                    
                    # mkdir -p robot_tests/results
                '''
            }
        }

        stage('Activate the Virtual Environment and Execute the Test') {
            steps {
                // Exectute the robot tests
                sh '''
                    . myenv/bin/activate
                    python --version
                    echo "Current Directory $(pwd)"
                    ls
                    
                    # Run Robot Framework tests with ReportPortal listener
                    #robot --listener robotframework_reportportal.listener \
                    #       --variable RP_ENDPOINT:"http://traefik:8080" \
                    #       --variable RP_API_KEY:"ReportPortal-Token_0ZYhiSVKR16XA75kbiZBypisG0Kx3q4w3nVd6ZtxmQ-XDVeByOfMF1WwX1Ox3NQr" \
                    #       --variable RP_PROJECT:"superadmin_personal" \
                    #       --variable RP_LAUNCH:"Robot Framework Launch" \
                    #       --outputdir templates/test_openbmc_setup.robot .

                    # Run Robot Framework tests without ReportPortal
                    #robot --outputdir results robot_tests
                    #robot -v 172.20.194.31 templates/test_openbmc_setup.robot
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
        
        // stage('Publish Robot Framework Results') {
        //     steps {
        //         // Publish the results from the results subdirectory
        //         robot outputPath: '/results'
        //     }
        // }

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
