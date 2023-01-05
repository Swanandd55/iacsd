FROM tomcat:8
COPY target/dvja-1.0-SNAPSHOT.war /usr/local/tomcat/webapp/appsecco.war
