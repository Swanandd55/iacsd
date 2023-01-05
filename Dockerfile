FROM tomcat:8
COPY /var/lib/jenkins/workspace/ansible-docker-maven/target/*.war /usr/local/tomcat/webapp/appsecco.war
