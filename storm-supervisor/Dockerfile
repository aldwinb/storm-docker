FROM wurstmeister/storm:0.9.4
MAINTAINER Wurstmeister

EXPOSE 6700
EXPOSE 6701
EXPOSE 6702
EXPOSE 6703
EXPOSE 8000
EXPOSE 22

RUN yum update -y && yum install -y openssh-clients

RUN /usr/bin/config-supervisord.sh supervisor
RUN /usr/bin/config-supervisord.sh logviewer

RUN mkdir -p /var/log/storm/streamparse

CMD /usr/bin/start-supervisor.sh




