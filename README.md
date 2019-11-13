# docker-samba-domain-controller

Alpine Linux based dockerized version of Samba configured as Domain Controller with OpenLDAP as backend.

## Configuration

The first time the container is started, it will provision a new domain controller, driven by the following environment variables (required):

- SAMBA_DC_REALM, the qualified name for the Domain Controller (e.g. MYDC.EXAMPLE.COM)
- SAMBA_DC_DOMAIN, the name for the Domain Controller (e.g. EXAMPLE)
- SAMBA_DC_ADMIN_PASSWD, the administrator password (e.g. Ch3ng3Me!)
- SAMBA_DC_DNS_BACKEND, a DNS backend for Samba (e.g. SAMBA_INTERNAL)

These values can be set in the `docker-compose.yml` file and the port mapping can be adjusted accordingly.

The default administrator account is `Administrator`.

## How to run

Simply run the following command:

`docker-compose up -d`