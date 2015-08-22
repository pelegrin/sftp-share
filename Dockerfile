FROM ubuntu:14.04

ENV USER service
ENV USER_UID 501

RUN apt-get update && \
    apt-get install -y openssh-server mcrypt && \
    mkdir /var/run/sshd && chmod 0755 /var/run/sshd

ADD start.sh /usr/local/bin/start.sh
ADD sshd_config /etc/ssh/sshd_config
ADD get-keys.sh /get-keys.sh

VOLUME ["/data", "/keys"]
EXPOSE 22

ENTRYPOINT ["/bin/bash", "/usr/local/bin/start.sh"]
