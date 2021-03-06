FROM centos:centos7.2.1511

MAINTAINER Wurstmeister

RUN yum update -y && yum install -y unzip \
  java-1.8.0-openjdk-1.8.0.121-0.b13.el7_3 \
  wget \
  openssh-server \
  openssl-devel \
  libffi-devel \
  libffi

RUN wget -O /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py \
  && python /tmp/get-pip.py \
  && rm -rf /tmp/get-pip.py

RUN pip install supervisor

RUN mkdir -p /etc/supervisord.d
RUN echo_supervisord_conf > /etc/supervisord.conf

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.121-0.b13.el7_3.x86_64/jre/

RUN echo 'root:wurstmeister' | chpasswd
RUN mkdir /var/run/sshd
RUN sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' \
  && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' \
  && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ''

ENV STORM_HOME /opt/apache-storm-0.10.1

RUN wget -q -O - http://mirrors.sonic.net/apache/storm/apache-storm-0.10.1/apache-storm-0.10.1.tar.gz | tar -xzf - -C /opt

RUN groupadd storm; useradd --gid storm --home-dir /home/storm --create-home --shell /bin/bash storm; chown -R storm:storm $STORM_HOME; mkdir /var/log/storm ; chown -R storm:storm /var/log/storm

RUN ln -s $STORM_HOME/bin/storm /usr/bin/storm

ADD storm.yaml $STORM_HOME/conf/storm.yaml
ADD cluster.xml $STORM_HOME/logback/cluster.xml
ADD config-supervisord.sh /usr/bin/config-supervisord.sh
ADD start-supervisor.sh /usr/bin/start-supervisor.sh 

RUN echo [supervisord] | tee -a /etc/supervisord.conf
RUN echo nodaemon=true | tee -a /etc/supervisord.conf
RUN echo [include] | tee -a /etc/supervisord.conf
RUN echo files=/etc/supervisord.d/*.conf | tee -a /etc/supervisord.conf

#EXPOSE 22
