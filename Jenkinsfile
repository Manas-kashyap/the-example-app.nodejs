pipeline {
	agent any
	stages {
		stage ('Install npm'){
			parallel {
				stage ('Install npm in ubuntu-slave') {
					agent {
						label 'ubuntu-slave'
					}
					steps {
						sh './dependency.sh'
					}
				}
				stage ('Install npm in debian-slave') {
					agent {
						label 'debian-slave'
					}
					steps {
						sh '/dependency.sh'
					}
				}
			}
		}
		stage ('Install dependency of project') {
			parallel {
				stage ('Install in ubuntu') {
					agent {
						label 'ubuntu-slave'
					}
					steps {
						sh 'npm install'
					}
				}
				stage ('Install in debian') {
					agent {
						label 'debian-slave'
					}
					steps {
						sh 'npm install'
					}
				}
			}
		}
		stage ('Run tests for test branch') {
			when {
				branch 'tests/visual-regression-testing'
			}
			parallel {
				stage ('TEST IN UBUNTU') {
					agent {
						label 'ubuntu-slave'
					}
					steps {
						try {
							sh 'npm test'
						}
						catch (exc) {
							echo 'TEST FAILED !!!!'
						}
					}
				}
				stage ('TEST IN DEBIAN') {
					agent {
						label 'debian-slave'
					}
					steps {
						try {
							steps {
							sh 'npm test'
							}
						}
						catch (exc) {
							steps {
							echo 'TEST FAILED !!!!'
							}
						}
						}
					}
				}
			}
			post {
				always {
					emailext body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}",
                recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']],
                subject: "Jenkins Build ${currentBuild.currentResult}: Job ${env.JOB_NAME}"
				}
			}
		}
	}