FROM tomcat:8.0-alphine
ADD ROOT*.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD [ "catalina.sh","run" ]
