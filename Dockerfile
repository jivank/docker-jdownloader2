FROM debian:jessie
MAINTAINER Jivan Kulkarni <jivank@gmail.com>


RUN apt-get update && \
    apt-get install -y --force-yes wget && \
    apt-get clean

RUN mkdir /jdownloader && cd /jdownloader && wget http://installer.jdownloader.org/JD2Setup_x64.sh && \
	yes '' | bash JD2Setup_x64.sh && rm JD2Setup_x64.sh

VOLUME /root/Downloads

CMD ["/usr/local/jd2/jre/bin/java","-Djava.awt.headless=true","-jar","/usr/local/jd2/JDownloader.jar"]
