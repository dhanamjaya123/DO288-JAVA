#Start with a base image containing Java runtime
FROM openjdk:11-slim as build

#Information around who maintains the image
MAINTAINER ibmdemo.com

# Add the application's jar to the container
COPY --from=build /home/student/DO288-JAVA/target/openshift-microservice-0.0.1-SNAPSHOT.jar openshift-microservice-0.0.1-SNAPSHOT.jar

#execute the application
ENTRYPOINT ["java","-jar","/openshift-microservice-SNAPSHOT.jar"]
