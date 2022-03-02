FROM openjdk:11-slim as build
EXPOSE 8082

ONBUILD RUN mvn clean install
ONBUILD ADD /target/openshift-microservice-0.0.1-SNAPSHOT.jar openshift-microservice-0.0.1-SNAPSHOT.jar
RUN chmod 755 /target

CMD ["java","-jar","/openshift-microservice-0.0.1-SNAPSHOT.jar"]


