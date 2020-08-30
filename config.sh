#!/usr/bin/env bash
set -euo pipefail

# keycloak admin user
readonly ADMIN=kcadmin ADMINPWD=admin

# realm admin user
readonly REALM=mockrealm
readonly USER1=user1 USER1PWD=pass1

# realm unprivledged keycloak user
readonly USER2=user2 USER2PWD=pass2

# this is a client ID/client secret for the mockrealm realm
readonly CLIENT_LOGIN_ID=mock_login_client
readonly CLIENT_LOGIN_SECRET=mock_login_secret

# base URLs for authentication from localhost (no tls) and
# from within the docker-compose network (with tls)
readonly BASEURL=http://localhost:8080/auth/realms/${REALM}
readonly BASEURL_TLS=https://oidc:8443/auth/realms/${REALM}

export ADMIN ADMINPWD
export USER USERPWD
export CLIENT_LOGIN_ID CLIENT_LOGIN_SECRET
export CLIENT_PERMISSIONS_ID CLIENT_PERMISSIONS_SECRET
export REALM
export BASEURL
