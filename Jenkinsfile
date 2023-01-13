node{
    stage('SCM Checkout'){
	git 'https://github.com/Swanandd55/iacsd.git'
	}
    stage('Compile-Package'){
	def mvnHome=tool name: 'maven-3', type: 'maven'
	sh "${mvnHome}/bin/mvn package"
	}
    stage('SonarQube Analysis'){
	 withSonarQubeEnv('SonarNET') {
         sh 'mvn clean install -U -DskipTests -f my-package/pom.xml sonar:sonar -Dsonar.login=16cd31d6c5649728fb7c4052100d25e90a82f671'   
    }
    }
	    
}
