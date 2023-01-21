node{
		stage('SCM'){
			steps{
				git credentialsId: 'github', url: 'https://github.com/Swanandd55/iacsd.git'
			}
		}
		stage('Maven Build'){
			steps{
				def mvnHome=tool name:'maven-3',type:'maven'
				sh "${mvnHome}/bin/mvn package"
			}
		}
    		stage('SonarQube Analysis') {
      		  def mvnHome=tool name:'maven-3',type:'maven'
      		  withSonarQubeEnv() {
       			sh "mvn clean verify sonar:sonar -Dsonar.projectKey=jenkins_integration -Dsonar.host.url=http://192.168.1.56:9000 -Dsonar.login=sqp_a5e99c1d5996a29601962ec6f2ba933efedf9580"
    			 }
    		}
}

