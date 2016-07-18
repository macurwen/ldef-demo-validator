FROM    centos:latest
MAINTAINER Heath Dinkins <heath.r.dinkins@leidos.com>
RUN yum -y update
RUN yum -y install java-1.7.0-openjdk-devel.x86_64
RUN mkdir -p /srv
ADD apache-maven-3.3.1-bin.tar.gz /srv
ADD LDEF-Demo-Validator.tar.gz /srv
ENV JAVA_HOME /usr/lib/jvm/java-1.7.0-openjdk-1.7.0.101-2.6.6.1.el7_2.x86_64/
ENV PATH "$JAVA_HOME/bin:$PATH"

ENV M2_HOME /srv/apache-maven-3.3.1
ENV PATH "$M2_HOME/bin:$PATH"

WORKDIR /srv/validator/LDEF-Demo-Validator
CMD ["mvn", "camel:run"]
