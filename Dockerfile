FROM centos:7

LABEL description="CentOS 7 with mfext, mfdata and mfserv installed"

# Configure yum repo
COPY metwork.repo /etc/yum.repos.d

# Install MFI apps
RUN yum -y install metwork-mfext \
    && yum -y install metwork-mfdata-minimal \
    && yum -y install metwork-mfserv 

