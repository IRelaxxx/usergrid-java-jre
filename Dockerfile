FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /usr/share/man/man1/

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends software-properties-common curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
RUN echo 'Europe/Berlin' > /etc/timezone && \
    dpkg-reconfigure tzdata

RUN apt-add-repository 'deb http://security.debian.org/debian-security stretch/updates main' && \
    apt-get update && \
    apt-get install -y --no-install-recommends openjdk-8-jre-headless && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
    
CMD ["bash"]
