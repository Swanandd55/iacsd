node{
		stage('SCM'){
				git credentialsId: 'github', url: 'https://github.com/Swanandd55/iacsd.git'
		}
		stage('Maven Build'){
				def mvnHome=tool name:'maven-3',type:'maven'
				sh "${mvnHome}/bin/mvn package"
		}
    		stage('SonarQube Analysis') {
      		  def mvnHome=tool name:'maven-3',type:'maven'
      		  withSonarQubeEnv('sonar') {
			  sh "${mvnHome}/bin/mvn sonar:sonar"
    			 }
    		}
}

