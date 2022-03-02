FROM openjdk:11-slim as build
EXPOSE 8082

ONBUILD RUN mvn install
ONBUILD ADD /target/openshift-microservice-0.0.1-SNAPSHOT.jar openshift-microservice-0.0.1-SNAPSHOT.jar
RUN chgrp -R 0 target && \ chmod -R g=u /target

CMD ["java","-jar","/openshift-microservice-0.0.1-SNAPSHOT.jar"]


