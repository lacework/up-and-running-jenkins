FROM --platform=linux/amd64 amd64/centos:latest
LABEL maintainer="tech-ally@lacework.net" \
      description="The Lacework CLI helps you manage the Lacework cloud security platform"
      
# fixing the EOL Centos 8 related issue for mirrorlist/appstream
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum update -y
COPY ./LICENSE /
RUN curl https://raw.githubusercontent.com/lacework/go-sdk/master/cli/install.sh | bash
