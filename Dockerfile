# ib-redis-base
FROM  centos

MAINTAINER Justin Davis <justinndavis@gmail.com>

ENV BUILDER_VERSION 1.0
ENV REDIS_VERSION 2.8.19

LABEL name="Iberia Base Centos/Redis Image" \
      vendor=Iberia \
      license=GPLv2 \
      build-date=20161002

LABEL io.k8s.description="Image for building Redis deployments" \
      io.k8s.display-name="Redis builder 1.0.0" \
      io.openshift.expose-services="6379:tcp" \
      io.openshift.tags="builder,1.0.0,redis,database,nosql" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"


RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm
RUN yum -y update
RUN yum -y install wget curl redis git ansible pyOpenSSL libxml2 libxslt
RUN yum clean all -y

RUN mkdir -p /ib/appl
WORKDIR /ib/appl

RUN mkdir -p /usr/libexec/s2i
COPY ./.s2i/bin/ /usr/libexec/s2i

RUN chgrp -R 0 /ib/appl
RUN chmod -R g+rw /ib/appl
RUN find /ib/appl -type d -exec chmod g+x {} +

USER 1001

EXPOSE 6379

CMD ["/usr/libexec/s2i/usage"]