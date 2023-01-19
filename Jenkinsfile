
pipeline{

	agent any

	stages {

		stage('Build') {

			steps {
				sh 'docker build . -t swanandd55/appsecco:1.0'
			}
		}

		stage('Login') {

			steps {
				withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'DockerHubpwd')]) {
					sh "docker login -u swanandd55 -p ${DockerHubpwd}"
				}
				sh 'docker push swanandd55/appsecco:1.0'
			}
		}

		stage('Deploy to K8s')
		{
			steps{
				sshagent(['k8s-jenkins'])
				{
					sh 'scp -r -o StrictHostKeyChecking=no node-deployment.yaml ec2-user@18.224.31.50:/home/ec2-user/'
					
					script{
						try{
							sh 'ssh ec2-user@18.224.31.50:/home/ec2-user/ kubectl apply -f /path/node-deployment.yaml --kubeconfig=/path/kube.yaml'

							}catch(error)
							{

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

}
