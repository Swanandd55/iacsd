node{
    stage('SCM Checkout'){
	git 'https://github.com/Swanandd55/iacsd.git'
	}
    stage('Compile-Package'){
	def mvnHome=tool name:'maven-3',type:'maven'
	    sh "${mvnHome}/bin/mvn package"
    }   
     stage('SonarQube Analysis'){
	 def mvnHome=tool name:'maven-3',type:'maven'
	 withSonarQubeEnv('Sonar Analysis') {
		mvn sonar:sonar -Dsonar.host.url=http://localhost:9000 
  -Dsonar.login=
    	}
    }
}
