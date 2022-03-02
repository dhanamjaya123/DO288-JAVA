FROM openjdk:11-slim as build
ADD /target/openshift-microservice-0.0.1-SNAPSHOT.jar openshift-microservice-0.0.1-SNAPSHOT.jar
EXPOSE 8082
ENTRYPOINT ["java", "-jar", "openshift-microservice-0.0.1-SNAPSHOT.jar"]

