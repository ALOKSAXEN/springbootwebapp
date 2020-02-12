#Base os
FROM centos:7

#required dependency installation 
RUN yum install git -y
RUN yum install java 8.0* -y
RUN yum install maven -y
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

#cloning of project from github
RUN git clone https://github.com/ALOKSAXEN/springbootwebapp.git

#build a jar file
RUN cd springbootwebapp && mvn clean && mvn package

#setting target folder as working directory 
WORKDIR /springbootwebapp/target


CMD java -jar spring-boot-web-0.0.1-SNAPSHOT.jars
