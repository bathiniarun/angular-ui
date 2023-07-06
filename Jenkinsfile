pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Build'
                sh 'npm run build'
            }
        }
stage('Run') {
            steps {
                // Start the Angular development server
                sh 'npm start'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Push'

                sh "aws s3 cp target/sample-1.0.3.jar s3://redbull-f1"
            }
        }
    }
}
