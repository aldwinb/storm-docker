FROM wurstmeister/storm:0.10.1
MAINTAINER Wurstmeister

EXPOSE 6700
EXPOSE 6701
EXPOSE 6702
EXPOSE 6703
EXPOSE 8000
EXPOSE 22

RUN yum update -y && yum install -y openssh-clients \
  gcc-c++ \
  boost-devel

RUN wget --quiet -O /usr/local/bin/jq http://stedolan.github.io/jq/download/linux64/jq \
  && chmod +x /usr/local/bin/jq

RUN pip install --upgrade awscli

COPY create-aws-sts-token.sh /usr/local/bin/create-aws-sts-token

RUN chmod +x /usr/local/bin/create-aws-sts-token \
  && mkdir /root/.aws \
  && mkdir -p /var/log/storm/streamparse

RUN /usr/bin/config-supervisord.sh supervisor
RUN /usr/bin/config-supervisord.sh logviewer

CMD /usr/bin/start-supervisor.sh




