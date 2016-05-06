FROM wurstmeister/storm:0.9.4
MAINTAINER Wurstmeister

RUN yum update -y
RUN yum install -y gcc \
  python-devel
RUN wget -O /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py
RUN python /tmp/get-pip.py
RUN pip install virtualenv streamparse
RUN mkdir -p /data/virtualenvs/
RUN mkdir -p /var/log/storm/streamparse

EXPOSE 6700
EXPOSE 6701
EXPOSE 6702
EXPOSE 6703
EXPOSE 8000

RUN /usr/bin/config-supervisord.sh supervisor
RUN /usr/bin/config-supervisord.sh logviewer
CMD /usr/bin/start-supervisor.sh




