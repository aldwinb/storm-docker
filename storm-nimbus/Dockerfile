FROM wurstmeister/storm:0.9.4
MAINTAINER Wurstmeister

RUN /usr/bin/config-supervisord.sh nimbus 
RUN /usr/bin/config-supervisord.sh drpc

EXPOSE 6627
EXPOSE 3772
EXPOSE 3773
ADD start-supervisor.sh /usr/bin/start-supervisor.sh

RUN curl -o /usr/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
RUN chmod a+x /usr/bin/lein

RUN yum update -y && yum install -y gcc \
  python-devel

RUN pip install streamparse

CMD /usr/bin/start-supervisor.sh
