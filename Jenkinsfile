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
}
stage("Quality Gate"){
  timeout(time: 1, unit: 'HOURS') { // Just in case something goes wrong, pipeline will be killed after a timeout
    def qg = waitForQualityGate() // Reuse taskId previously collected by withSonarQubeEnv
    if (qg.status != 'OK') {
      error "Pipeline aborted due to quality gate failure: ${qg.status}"
    }
  }
}
