pipeline{
	agent any
	tools {
  		maven 'maven-3'
	}
	stages{
		stage('SCM'){
			steps{
				git credentialsId: 'github', url: 'https://github.com/Swanandd55/iacsd.git'
			}
		}
		stage('Maven Build'){
			steps{
				sh "mvn clean package"
			}
		}
    		stage('SonarQube Analysis') {
      		  def mvn = tool 'Default Maven';
      		  withSonarQubeEnv() {
       			sh "${mvn}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=jenkins_integration"
    			}
  		}
	}
}
