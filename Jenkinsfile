node{
		stage('SCM'){
				git credentialsId: 'github', url: 'https://github.com/Swanandd55/iacsd.git'
		}
		stage('Maven Build'){
				def mvnHome=tool name:'maven',type:'maven'
				sh "${mvnHome}/bin/mvn package"
		}
}
