FROM openjdk:19-jdk-alpine3.16

WORKDIR /app

COPY ./target/java-maven-app-1.1.0-SNAPSHOT.jar .

CMD ["java", "-jar", "java-maven-app-1.1.0-SNAPSHOT.jar"]

