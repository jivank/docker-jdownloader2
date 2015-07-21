FROM debian:jessie
MAINTAINER Jivan Kulkarni <jivank@gmail.com>


RUN apt-get update && \
    apt-get install -y --force-yes wget screen && \
    apt-get clean

RUN mkdir /jdownloader && cd /jdownloader && wget http://installer.jdownloader.org/JD2Setup_x64.sh && \
	yes '' | bash JD2Setup_x64.sh && rm JD2Setup_x64.sh

VOLUME /root/Downloads
ADD start.sh /root/
RUN chmod +x /root/start.sh

CMD ["/root/start.sh"]