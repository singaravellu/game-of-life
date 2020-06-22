FROM tomcat:8.0
LABEL Author="venkateshsingaravelu95335@gmail.com"
COPY gameoflife-web/target/*.war  /usr/local/tomcat/webapps/
EXPOSE  8080
CMD ["catalina.sh", "run"]