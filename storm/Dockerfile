FROM centos:centos7.2.1511
MAINTAINER Wurstmeister
RUN yum update -y
RUN yum install -y unzip \
  java-1.7.0-openjdk \
  wget \
  openssh-server
  #supervisor \
  #docker.io \

RUN wget -O /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py
RUN python /tmp/get-pip.py
RUN pip install supervisor

RUN mkdir -p /etc/supervisor/conf.d
RUN echo_supervisord_conf > /etc/supervisor/supervisord.conf
RUN ln -s /etc/supervisor/supervisord.conf /etc/supervisord.conf

#RUN tee /etc/yum.repos.d/docker.repo <<-'EOF'
#RUN yum install docker-engine

ENV JAVA_HOME java-1.7.0-openjdk-1.7.0.101-2.6.6.1.el7_2.x86_64
RUN echo 'root:wurstmeister' | chpasswd
RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

RUN wget -q -O - http://mirrors.sonic.net/apache/storm/apache-storm-0.9.4/apache-storm-0.9.4.tar.gz | tar -xzf - -C /opt

ENV STORM_HOME /opt/apache-storm-0.9.4
RUN groupadd storm; useradd --gid storm --home-dir /home/storm --create-home --shell /bin/bash storm; chown -R storm:storm $STORM_HOME; mkdir /var/log/storm ; chown -R storm:storm /var/log/storm

RUN ln -s $STORM_HOME/bin/storm /usr/bin/storm

ADD storm.yaml $STORM_HOME/conf/storm.yaml
ADD cluster.xml $STORM_HOME/logback/cluster.xml
ADD config-supervisord.sh /usr/bin/config-supervisord.sh
ADD start-supervisor.sh /usr/bin/start-supervisor.sh 

RUN echo [supervisord] | tee -a /etc/supervisor/supervisord.conf ; echo nodaemon=true | tee -a /etc/supervisor/supervisord.conf
