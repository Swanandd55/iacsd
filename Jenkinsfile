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
		 withSonarQubeEnv('sonar'){
		 mvn clean verify sonar:sonar -Dsonar.login=6d071203c46f846ad7e3bf578c8318e3c0b6341f
		 }
    	}
    }
}
