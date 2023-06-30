pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Build'
                sh 'mvn run build'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Push'

                sh "aws s3 cp target/sample-1.0.3.jar s3://haas-f1"
            }
        }

    
        
    }
}