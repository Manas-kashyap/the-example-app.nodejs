pipeline {
    agent any
    stages {
    	stage('Install npm') {
            steps {
                sh 'curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -'
                sh 'sudo apt install nodejs'
            }
        }
        stage('Build') {
            steps {
                sh 'npm install'
                echo "npm installed"
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
                echo "pata hai test  fail hoga"
            }
        }
        stage('Deliver') { 
            steps {
            	input 'Proceed to Deploy'
                sh 'npm run start:dev'
                echo 'chal gaya'
            }
        }
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
        }
        success {
        	echo 'Pass'
        }
        failure {
        	echo 'fail'
        }
    }
}
