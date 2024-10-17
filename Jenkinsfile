pipeline
{    
    agent any   
    stages
    {
	stage('Install Dependencies') {
            steps {
                sh 'pip install robotframework'
                sh 'pip install robotframework-reportportal'
            }
        }
	
	stage('Checkout') {
            steps {
                // Checkout the main branch
                git branch: 'main', url: 'https://github.com/sarath1726/Jenkins.git'
            }
        }
        
	stage('Run Robot Framework Tests and Update Results in ReportPortal') {
            steps {
            	// Create results directory and run tests
                sh 'mkdir -p results'
                // sh 'robot --outputdir results robot_tests'
		sh 'robot --outputdir results robot_tests'
	    }
        }
    }

    post {
        always {
            // Publish Robot Framework results
            robot outputPath: 'results'
        }
    }
}
