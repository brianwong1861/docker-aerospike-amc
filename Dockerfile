FROM ubuntu:xenial

MAINTAINER Félix Sanz <me@felixsanz.com>

RUN apt-get update -y

RUN apt-get install -y gcc python-dev net-tools curl

RUN curl -L http://www.aerospike.com/download/amc/3.6.13/artifact/ubuntu12 -o aerospike-amc.deb && \
  dpkg -i aerospike-amc.deb && \
  rm aerospike-amc.deb

RUN apt-get purge -y --auto-remove curl

EXPOSE 8081

CMD /usr/sbin/service amc start && tail -f /var/log/amc/*.log
