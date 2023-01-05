FROM tomcat:8
COPY /var/lib/jenkins/workspace/ansible-docker-maven/target/dvja-1.0-SNAPSHOT.war /usr/local/tomcat/webapp/appsecco.war
