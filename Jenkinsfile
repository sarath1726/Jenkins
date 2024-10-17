pipeline
{    
    agent any   
    stages
    {
	stage('Install Dependencies') {
            steps {
                sh '''
                    pip install robotframework
                    pip install robotframework-reportportal
                '''
            }
        }
	stage('Checkout')
	{
            steps 
	    {
                // Checkout the main branch
                git branch: 'main', url: 'https://github.com/sarath1726/Jenkins.git'
            }
        }
        
	stage('Run Robot Framework Tests and Update Results in ReportPortal')
	{
            steps
	    {
		sh '''
            	    // Create results directory and run tests
              	    mkdir -p results
                    // sh 'robot --outputdir results robot_tests'
		    robot --listener robotframework_reportportal.listener --outputdir results robot_tests
                '''
	    }
        }
    }

    post
    {
        always
	{
            // Publish Robot Framework results
            robot outputPath: 'results'
        }
    }
}
