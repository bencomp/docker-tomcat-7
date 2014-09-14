FROM sionsmith/oracle-java8

MAINTAINER Sion Smith sion.smith@gmail.com

RUN apt-get -qq update

#download and extract tomcat.
RUN (wget -O /tmp/tomcat7.tar.gz http://mirror.cogentco.com/pub/apache/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz && \
	cd /opt && \
	tar zxf /tmp/tomcat7.tar.gz && \
	mv /opt/apache-tomcat* /opt/tomcat && \
	rm /tmp/tomcat7.tar.gz)

# download and extract Quoddy code
RUN (wget -O /tmp/quoddy.tar.gz https://github.com/fogbeam/Quoddy/archive/v0.0.0-tpr1.tar.gz && \
	cd /opt && \
	tar zxf /tmp/quoddy.tar.gz && \
	rm /tmp/quoddy.tar.gz)

# download Quoddy WAR
RUN wget -O /opt/tomcat/webapps/quoddy.war https://github.com/fogbeam/Quoddy/releases/download/v0.0.0-tpr1/quoddy.war

# Postgres should be running at this point.
# Database initialisation should happen in the database container

#start script which first updates web.xml before starting server.	
ADD ./runserver.sh /usr/local/bin/run

#Tomcat is run on 8080 by default.
EXPOSE 8080

CMD ["/bin/sh", "-e", "/usr/local/bin/run"]
