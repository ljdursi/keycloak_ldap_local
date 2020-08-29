#!/bin/bash
set -euo pipefail

openssl genrsa -des3 -out rootCA.key 4096
openssl req -x509 -new -nodes -key rootCA.key -subj '/C=CA/ST=Ontario/O=Demo/CN=Beacon Self-signed Root' -sha256 -days 1024 -out rootCA.crt

# generate IdP cert

openssl genrsa -out oidc/tls.key 2048
openssl req -new -sha256 -key oidc/tls.key -subj '/C=CA/ST=Ontario/O=Demo/CN=oidc' -out oidc/tls.csr
openssl x509 -req -in oidc/tls.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out oidc/tls.crt -days 500 -sha256
rm oidc/tls.csr

# generate LDAP cert

openssl genrsa -out ldap_mock/tls.key 2048
openssl req -new -sha256 -key ldap_mock/tls.key -subj '/C=CA/ST=Ontario/O=Demo/CN=opa' -out ldap_mock/tls.csr
openssl x509 -req -in ldap_mock/tls.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out ldap_mock/tls.crt -days 500 -sha256
rm ldap_mock/tls.csr