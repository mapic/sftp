FROM debian:jessie
MAINTAINER Adrian Dvergsdal [atmoz.net]

# - Install packages
# - OpenSSH needs /var/run/sshd to run
# - Remove generic host keys, entrypoint generates unique keys
RUN apt-get update && \
    apt-get -y install openssh-server && \
    mkdir -p /var/run/sshd && \
    rm -f /etc/ssh/ssh_host_*key* && \
    rm -rf /var/lib/apt/lists/*


COPY sshd_config /etc/ssh/sshd_config
COPY entrypoint /
COPY README.md /

VOLUME /etc/ssh

EXPOSE 22

ENTRYPOINT ["/entrypoint"]
