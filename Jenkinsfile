node {
  stage('SCM') {
    checkout scm
  }
  stage('SonarQube Analysis') {
    def mvnHome = tool name:'maven-3',type:'maven';
    withSonarQubeEnv() {
      sh "${mvnHome}/bin/mvn clean verify sonar:sonar -Dsonar.projectKey=jenkins_integration"
    }
  }
  stage('QualityGate'){
    timeout(time:1, unit: 'HOURS') {
    def qg=waitForQualityGate()
      if (qg.status != 'OK'){
        error "Pipeline aborted due to quality gate failure: ${qg.status}"

      }
    }
    }
}
