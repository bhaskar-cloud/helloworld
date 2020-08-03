# Base Image:
FROM nimmis/java-centos:openjdk-8-jdk

# Labels:
LABEL maintainter="helloworld-v1.1@uidai.gov.in"

# Create User:
RUN useradd -ms /bin/bash uidapp
USER uidapp
WORKDIR /home/uidapp

# Installing Application:
COPY ./target/helloworld-1.1.jar /home/uidapp/helloworld-1.1.jar

# Port
EXPOSE 9020
