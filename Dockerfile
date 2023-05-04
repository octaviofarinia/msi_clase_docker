FROM alpine:latest as build

RUN apt-get update
RUN apt-get install openjdk-17-jdk -y

COPY . .
RUN ./gradlew bootJar --no-daemon

FROM openjdk:17-alpine
EXPOSE 8080
COPY ./build/libs/claseDocker-0.0.1.jar ./app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]