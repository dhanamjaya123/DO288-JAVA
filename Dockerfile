FROM openjdk:11-slim as build
EXPOSE 8082

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
RUN chgrp -R 0 /usr/src/app && \
    chmod -R g=u /usr/src/
ONBUILD ADD . /usr/src/app
ONBUILD RUN mvn install
ONBUILD ADD /usr/src/app/target/openshift-microservice-0.0.1-SNAPSHOT.jar app.jar

CMD ["java","-jar","/app.jar"]


