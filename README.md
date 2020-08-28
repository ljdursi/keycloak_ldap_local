# Keycloak: LDAP + local user registrations demo

(Takes a lot from https://idaccessman.wordpress.com/2018/08/26/ldap-federation-with-keycloak/)

## Running

Fire the keycloak (odic) and LDAP server (ldap) up:

```
docker-compose up -d
```

While keycloak is booting up set up the users in the ldap service

 ```
 ./ldap_mock/config_ldap

 ```

and when Keycloak up and running (when `docker-compose logs oidc` shows `Admin console listening`), add the realm and users

 ```
 ./oidc/config-oidc-service
 ```

That restarts the IdP and so will take 20 seconds or so.

## Loging in as realm admin

Now log in to the mockrealm admin console with username user1/pass1 at: http://127.0.0.1:8080/auth/admin/mockrealm/console/

## Allowing user registration

Go to the "Realm Settings" and under the "Login" tab, enable user registration.

## Adding the LDAP

Under "User Federation", add an LDAP provider. 

We're going to set the following parameters:

* import users: OFF
* edit mode: READ_ONLY
* sync registrations: off
* vendor: Other
* username LDAP attribute: mail
* RDN LDAP attribute: uid
* UUID LDAP attribute: uid
* User Object Classes: inetOrgPerson
* Connection URL: ldap://ldap:389
* Users DN: `ou=users,dc=example,dc=org
* Custom User LDAP Filter: _leave blank_
* Search Scope: One Level
* Bind Type: simple
* Bind DN: `cn=admin,dc=example,dc=org`"
* Bind Credential: `admin`

That should be enough; hit "save" and then "Test Connection"
