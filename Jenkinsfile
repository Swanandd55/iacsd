node{
    stage('SCM Checkout'){
	git 'https://github.com/Swanandd55/iacsd.git'
	}
    stage('Compile-Package'){
	sh "mvn clean package"
	}
    stage('SonarQube Analysis'){
	 withSonarQubeEnv('SonarNET') {
         sh 'mvn clean install -U -DskipTests -f my-package/pom.xml sonar:sonar -Dsonar.login=1e17da0be8d24ec635a3be45b9cde4cbb05c7bb4'   
    }
    }
	    
}
