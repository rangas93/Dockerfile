FROM ubuntu

MAINTAINER Sravani

RUN apt-get update -y
RUN apt-get -y install openjdk-8-jdk wget git
RUN java –version
RUN mkdir /usr/local/tomcat
WORKDIR /usr/local/tomcat
RUN wget http://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.27/bin/apache-tomcat-9.0.27.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-9.0.27/* /usr/local/tomcat/.
RUN git clone https://github.com/Sravani9611/Dockerfile.git
RUN cd /usr/local/tomcat/Dockerfile/ && ls
COPY /usr/local/tomcat/Dockerfile/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY /usr/local/tomcat/Dockerfile/server.xml /usr/local/tomcat/conf/server.xml
COPY /usr/local/tomcat/Dockerfile/context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
COPY /usr/local/tomcat/webapps/build /root/.jenkins/workspace/jenkins-docker/build


EXPOSE 8082

CMD /usr/local/tomcat/bin/catalina.sh run
