FROM openjdk:11-slim as build
# Make port 8012 available to the world outside this container
EXPOSE 8012

# Define environment variable
ENV NAME tes

ONBUILD ADD . /usr/src/app
ONBUILD RUN mvn install
ONBUILD ADD /usr/src/app/target/openshift-microservice-0.0.1-SNAPSHOT.jar tes.jar


CMD ["java","-jar","/tes.jar"]


