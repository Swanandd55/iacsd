node{
    stage('SCM Checkout'){
	git 'https://github.com/Swanandd55/iacsd.git'
	}
    stage('Compile-Package'){
	def mvnHome=tool name: 'maven-3', type: 'maven'
	sh "${mvnHome}/bin/mvn package"
	}
	stage('Deploy to Tomcat'){
		sshagent(['dev-tomcat']){
		sh 'scp -o StrictHostKeychecking=no target/*.war ec2-user@18.220.230.104:/opt/'
		}
	}
}
