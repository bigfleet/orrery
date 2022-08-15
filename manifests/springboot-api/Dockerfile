FROM gradle:jdkPARAM_JAVA_VERSION AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon 

FROM openjdk:PARAM_JAVA_VERSION-slim

EXPOSE 8080

RUN mkdir /app

COPY --from=build /home/gradle/src/build/libs/PARAM_APP_NAME-0.0.1-SNAPSHOT.jar /app/spring-boot-application.jar
WORKDIR /app

ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-Djava.security.egd=file:/dev/./urandom","-jar","/app/spring-boot-application.jar"]