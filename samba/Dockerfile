FROM alpine:latest

LABEL maintainer = "Michele Adduci <adduci.michele@gmail.com>"

# Expose ports
EXPOSE 389/tcp \
       636/tcp

ADD docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]

RUN echo "Installing dependencies" && \
    apk --update --no-cache add \
        py3-dnspython \
        py3-bind \
        openldap \
        openldap-backend-all \
        openldap-overlay-all \
        samba \
        samba-dc \
        acl \
        gnutls && \
    echo "Setting permission for entrypoint" && \
    chmod +x /docker-entrypoint.sh && \
    echo "Removing default configuration of Samba before provisioning the DC" && \
    rm -rf /etc/samba/smb.conf && \
    rm -rf /var/lib/samba/* && \
    rm -rf /var/log/samba/*
