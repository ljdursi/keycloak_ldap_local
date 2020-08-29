#!/bin/bash -x
source config.sh

readonly defaultuser="None"
readonly defaultpass="None"
readonly MADEUP_REDIRECT="http://localhost:3000/auth/oidc"

readonly USER=${1:-$defaultuser}
readonly PASSWD=${2:-$defaultpass}

function usage {
     >&2 echo "Gets authorization token for user"
     >&2 echo "Usage: $0 usename password"
     exit 1
}

if [ "${USER}" == "${defaultuser}" ]
then
     >&2 echo "No user provided"
     usage
fi

if [ "${PASSWD}" == "${defaultpass}" ]
then
     >&2 echo "No password provided"
     usage
fi

curl -u ${CLIENT_LOGIN_ID}:${CLIENT_LOGIN_SECRET} \
     -X POST "${BASEURL}/protocol/openid-connect/token" \
     -d "grant_type=password&username=${USER}&password=${PASSWD}&redirect_uri=${MADEUP_REDIRECT}"