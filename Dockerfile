FROM openjdk:11-slim as build
# Make port 8012 available to the world outside this container
EXPOSE 8012

# Define environment variable
ENV NAME tes

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ONBUILD ADD . /usr/src/app
ONBUILD RUN mvn install
ONBUILD ADD /usr/src/app/target/openshift-microservice-0.0.1-SNAPSHOT.jar tes.jar

# Install below packages to get system resource
RUN echo "http://dl-1.alpinelinux.org/alpine/v3.9/main" >> /etc/apk/repositories
RUN echo "http://dl-2.alpinelinux.org/alpine/v3.9/main" >> /etc/apk/repositories
RUN echo "http://dl-3.alpinelinux.org/alpine/v3.9/main" >> /etc/apk/repositories
RUN echo "http://dl-4.alpinelinux.org/alpine/v3.9/main" >> /etc/apk/repositories
RUN echo "http://dl-5.alpinelinux.org/alpine/v3.9/main" >> /etc/apk/repositories

FROM openjdk:8-jre-slim
RUN apt-get update -y; \
 apt-get install -y --no-install-recommends iproute2 procps sysstat dumb-init bash coreutils sed; \
        rm -rf /var/lib/apt/lists/*

CMD ["java","-jar","/tes.jar"]


