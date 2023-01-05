FROM tomcat:8
COPY /var/lib/jenkins/workspace/ansible-docker-maven/target/abc.txt /usr/local/tomcat/webapp/appsecco.txt
