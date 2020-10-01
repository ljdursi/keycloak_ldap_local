# Keycloak Theme for myUHN Login Page

Login theme for PATH application Keycloak instance. Helps with the
design that matches the rest of the website. Keycloak uses Freemarker
templates, or FTL files.

## Build

The author has no idea how to build this locally while developing. So,
we need to deploy the changes to a dev server to test them out.

## Deploy

### Prerequisites

1. Docker container or a server running.
2. Access to the server to push the files to.

### Docker

1. Make the changes to the files.
2. Push the changes to $DOCKERCONTAINER 
   `docker cp themse/uhn $DOCKERCONTAINER:/opt/jboss/keycloak/themes/`
   This will put the theme directory `uhn` under the corresponding
   themes directory in the container.
3. Restart the Keycloak container.
   This is needed mostly for FTL file changes. 

### Non-docker

1. Make the changes to the files.
2. Push the changes to $SERVER 
   `scp themes/uhn $SERVER:/path/to/jboss/keycloak/themes/`
   This will put the theme directory `uhn` under the corresponding
   themes directory on the server.
3. Restart the Keycloak server.
   This is needed mostly for FTL file changes. 

## Theme change

1. Log into the Keycloak server as admin.
2. Go to the appropriate realm -> `Realm settings`.
3. Go to the tab `Themes`.
4. Change the login theme. You should see the theme `uhn` in the list.

These changes should now be visible under the corresponding login page
of that realm. 