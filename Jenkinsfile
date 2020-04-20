pipeline {
    agent any 
        stages {
            parallel {
                stage ('Install Dependencies in ubuntu Slave') {
                agent {
                    label "ubuntu"
                }
                steps {
                    sh 'install'
                }
            }
            stage ('Install Dependencies in debian Slave') {
                agent {
                    label "debian"
                }
                steps {
                    sh 'install'
                }
            }
        }
    }
