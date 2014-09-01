FROM sionsmith/oracle-java8

MAINTAINER Sion Smith sion.smith@gmail.com

RUN apt-get -qq update

RUN (wget -O /tmp/tomcat7.tar.gz http://mirror.cogentco.com/pub/apache/tomcat/tomcat-7/v7.0.55/bin/apache-tomcat-7.0.55.tar.gz && \
	cd /opt && \
	tar zxf /tmp/tomcat7.tar.gz && \
	mv /opt/apache-tomcat* /opt/tomcat && \
	rm /tmp/tomcat7.tar.gz)
	
ADD ./run.sh /usr/local/bin/run

EXPOSE 8080

CMD ["/bin/sh", "-e", "/usr/local/bin/run"]
