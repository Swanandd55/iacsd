node{
		stage('SCM'){
			steps{
				git credentialsId: 'github', url: 'https://github.com/Swanandd55/iacsd.git'
			}
		}
		stage('Maven Build'){
			steps{
				def mvnHome=tool name:'maven-3',type:'maven'
				sh "${mvnHome}/bin/mvn packge"
			}
		}
    		stage('SonarQube Analysis') {
      		  def mvnHome=tool name:'maven-3',type:'maven'
      		  withSonarQubeEnv() {
       			sh "${mvn}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=jenkins_integration"
    			 name}
  		}
    }

