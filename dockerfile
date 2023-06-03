FROM tomcat:latest
LABEL maintainer="muthukumar"
ADD ./target/addressbook.war /usr/share/tomcat/webapps
EXPOSE 8081
CMD ["catalina.sh", "run"]
