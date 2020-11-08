FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /usr/share/man/man1/

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends software-properties-common curl git htop unzip openjdk-11-jre-headless&& \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
RUN echo 'Europe/Berlin' > /etc/timezone && \
    dpkg-reconfigure tzdata
    
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
    
CMD ["bash"]