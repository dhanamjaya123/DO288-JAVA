FROM openjdk:11-slim as build
EXPOSE 8082

RUN mkdir -p /home/student/src/app
WORKDIR /home/student/src/app
ONBUILD ADD . /home/student/src/app
ONBUILD RUN mvn clean install
ONBUILD ADD /home/student/src/app/target/openshift-microservice-0.0.1-SNAPSHOT.jar openshift-microservice-0.0.1-SNAPSHOT.jar

CMD ["java","-jar","/openshift-microservice-0.0.1-SNAPSHOT.jar"]


