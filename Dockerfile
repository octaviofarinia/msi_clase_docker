FROM alpine:latest as build

RUN apk update
RUN apk add openjdk-17-jdk -y

COPY . .
RUN ./gradlew bootJar --no-daemon

FROM openjdk:17-alpine
EXPOSE 8080
COPY --from=build ./build/libs/claseDocker-0.0.1.jar ./app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]