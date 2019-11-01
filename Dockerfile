FROM alpine:3.10

LABEL maintainer="André Möller <development@andre-moeller.eu>"

RUN apk --update add python py-pip openssl ca-certificates git && \
    apk --update add --virtual build-dependencies python-dev libffi-dev openssl-dev build-base && \
    pip install --upgrade pip && \
    pip install ansible ansible-lint requests google-auth apache-libcloud PyCrypto google-api-python-client google-auth-httplib2 && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/*

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
