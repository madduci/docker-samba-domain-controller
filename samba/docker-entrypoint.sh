#!/bin/sh
# Copyright 2019-TODAY Michele Adduci
# License Apache 2.0 (https://www.apache.org/licenses/LICENSE-2.0.html).

set -e

# Configure the AD DC
if [ ! -f /etc/samba/smb.conf ]; then
    echo "### ${SAMBA_DC_DOMAIN} - Begin Domain Provisioning"
    samba-tool domain provision --domain="${SAMBA_DC_DOMAIN}" \
        --adminpass="${SAMBA_DC_ADMIN_PASSWD}" \
        --server-role=dc \
        --realm="${SAMBA_DC_REALM}" \
        --dns-backend="${SAMBA_DC_DNS_BACKEND}" \
        --use-rfc2307
    echo "### ${SAMBA_DC_DOMAIN} - Domain Provisioned Successfully"
fi

exec /usr/sbin/samba -i