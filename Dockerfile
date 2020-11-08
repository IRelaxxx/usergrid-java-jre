FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /usr/share/man/man1/

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends software-properties-common curl git htop unzip openjdk-14-jre-headless&& \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
RUN echo 'Europe/Berlin' > /etc/timezone && \
    dpkg-reconfigure tzdata
    
ENV JAVA_HOME /usr/lib/jvm/java-14-openjdk-amd64/
    
CMD ["bash"]
