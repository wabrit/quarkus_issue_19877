FROM openjdk:11-jdk

# Create app directory
RUN mkdir -p /usr/app
WORKDIR /usr/app

# Install app dependencies
COPY /target/otelnative.jar /usr/app/

ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

EXPOSE 8095

# Serve jar
ENTRYPOINT ["java", "-jar", "/usr/app/otelnative.jar"]