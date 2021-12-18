pipeline {
        environment {
                region = 'eu-west-1'
        }
    stages {
        stage("Build static site") {
            steps {
                    echo "Hello Dipen"
                    echo "Congratulations"
        }
        stage("Deploy to S3") {
                steps {
                       echo "Deploye S3 Bucket" 
		    }
			echo "S3 bucket created"
                }
        }
        stage("clear Cache") {
                 steps {
			            echo "Bucket varified" 
                 }
         }
   }
}
