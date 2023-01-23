pipeline{
	agent any
	tools {
  		maven 'maven-3'
	}
	environment {
  		DOCKER_TAG = getVersion()
	}
	stages{
		stage('SCM'){
			steps{
				git credentialsId: 'github', url: 'https://github.com/Swanandd55/iacsd.git'
			}
		}
		stage('Maven Build'){
			steps{
				def mvnHome = tool name:'maven-3',type:'maven';
				sh "${mvnHome}/bin/mvn package"
			}
		}
		stage('SonarQube Analysis') {
			steps{
   		 		def mvnHome = tool name:'maven-3',type:'maven';
    		 		withSonarQubeEnv() {
      					sh "${mvnHome}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=jenkins_integration"
				}
    			}
  		}
		stage('Build') {
			steps{
				sh 'docker build . -t swanandd55/appsecco:${DOCKER_TAG}'
			}
		}

		stage('Login') {
			steps{
				withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'DockerHubpwd')]) {
					sh "docker login -u swanandd55 -p ${DockerHubpwd}"
				}
					sh 'docker push swanandd55/appsecco:${DOCKER_TAG}'
			}
		}

		stage('Deploy to K8s'){
			steps{
				sh "chmod +x changeTag.sh"
				sh "./changeTag.sh ${DOCKER_TAG}"
				sshagent(['kubernetes_client'])
				{
					sh 'scp -o StrictHostKeyChecking=no node-deployment.yaml ubuntu@3.144.115.102:/home/ubuntu/'
					
					script{
						try{
							sh "ssh ubuntu@3.144.115.102 kubectl apply -f ."
						}catch(error){
							sh "ssh ubuntu@3.144.115.102 kubectl create -f ."	
						}
					}
				}
			}
		}
	}
	}
	post {
		always {
			sh 'docker logout'
		}
	}

def getVersion(){
	def hashcommit=sh returnStdout: true, script: 'git rev-parse --short HEAD'
	return hashcommit
}
