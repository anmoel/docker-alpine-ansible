FROM alpine:3.8

MAINTAINER André Möller <development@andre-moeller.eu>

RUN apk --update add python py-pip openssl ca-certificates && \
    apk --update add --virtual build-dependencies python-dev libffi-dev openssl-dev build-base && \
    pip install --upgrade pip cffi ansible ansible-lint && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/*

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
