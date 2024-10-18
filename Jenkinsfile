pipeline
{
    agent any
    stages {
        
	stage('Checkout') {
            steps {
                // Checkout the main branch
                git branch: 'main', url: 'https://github.com/sarath1726/Jenkins.git'
	    }
	}
	
	stage('Run Tests') {
	    steps {
        	sh '''
		source /path/to/venv/bin/activate
        	mkdir -p results
        	robot --outputdir results robot_tests
        	'''
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
