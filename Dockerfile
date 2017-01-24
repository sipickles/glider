FROM centos

MAINTAINER sipickles

RUN curl -o go.tgz https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz

RUN tar -C /usr/local -xvzf go.tgz
RUN mkdir -p /golang/{bin,pkg,src}
ENV PATH=$PATH:/usr/local/go/bin
ENV GOBIN=/golang/bin
ENV GOPATH=/golang

RUN yum update -y
RUN yum install -y which
ENV PATH=$PATH:$GOBIN

COPY glide-v0.11.1-linux-amd64.tar.gz /glide-v0.11.1-linux-amd64.tar.gz

RUN tar xvzf glide-v0.11.1-linux-amd64.tar.gz

RUN mv /linux-amd64/glide /usr/local/bin/

RUN glide --version
WORKDIR /code

RUN yum install -y git

ADD up.sh /up.sh
ENTRYPOINT /up.sh



