FROM tomcat:8
COPY target/*.war /usr/local/tomcat/webapp/dvja-1.0-SNAPSHOT.war
