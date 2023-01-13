node{
    stage('SCM Checkout'){
	git 'https://github.com/Swanandd55/iacsd.git'
	}
    stage('Compile-Package'){
	def mvnHome=tool name:'maven-3',type:'maven'
	    sh "${mvnHome}/bin/mvn package"
    }   
     stage('SonarQube Analysis'){
	 withSonarQubeEnv('Sonar Analysis') {
		def mvnHome=tool name:'maven-3',type:'maven'
		 withSonarQubeEnv('sonar'){
		 sh "${mvnHome}/bin/mvn sonar:sonar"
		 }
    	}
    }
}
