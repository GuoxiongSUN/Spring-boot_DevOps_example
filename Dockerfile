FROM openjdk:11
WORKDIR /opt/app
ARG JAR_FILE=/target/users-azure-0.0.1-SNAPSHOT.jar
COPY ${JAR_FILE} users.jar
ENTRYPOINT ["java","-jar","users.jar"]