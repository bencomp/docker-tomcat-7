docker-tomcat-7
===============

ports:
  - by default 8080 is exposed.
  - use Docker -p to amed listening port. <b>Note:</b> 80 is a reserved port.
  
run:
  - docker run -d --name tomcat -p 8080:8080 sionsmith/tomcat-7
