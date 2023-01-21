node {
  stage('SCM') {
    checkout scm
  }
  stage('SonarQube Analysis') {
    def mvnHome = tool name:'Maven-3',type:'maven';
    withSonarQubeEnv() {
      sh "${mvnHome}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=jenkins_integration"
    }
  }
}
