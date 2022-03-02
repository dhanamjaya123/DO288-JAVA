FROM openjdk:11-slim as build
EXPOSE 8082

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ONBUILD ADD . /usr/src/app
ONBUILD RUN mvn clean install
ONBUILD ADD /usr/src/app/target/openshift-microservice-0.0.1-SNAPSHOT.jar openshift-microservice-0.0.1-SNAPSHOT.jar

CMD ["java","-jar","/openshift-microservice-0.0.1-SNAPSHOT.jar"]


