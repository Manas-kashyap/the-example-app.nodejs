pipeline {
    agent any 
        stages {
            stage('Parallel Stage'){
                parallel {
                    stage ('Install Dependencies in ubuntu Slave') {
                agent {
                    label "ubuntu-slave"
                }
                steps {
                    sh './dependency.sh'
                }
            }
            stage ('Install Dependencies in debian Slave') {
                agent {
                    label "debian-slave"
                }
                steps {
                    sh './dependency.sh'
                }
            }
        }
    }
}
}