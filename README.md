Rundeck for docker management
=============================
This image enables you to manage your docker on server using docker-compose.

###Default rundeck version: 2.6.8

###Docker info
* build image (only needed if you clone this github repository)
```bash
docker build -t rundeck-docker ./
```
*  build image with specified rundeck version
```bash
docker build -t rundeck-docker --build-arg="RUNDECK_VERSION=2.6.8" ./
```

* launch container
```bash
docker run -d -p 4440:4440 -v /tmp/rundeck/var/rundeck:/var/rundeck -v /tmp/rundeck/var/lib/rundeck/var:/var/lib/rundeck/var -v /tmp/rundeck/var/lib/rundeck/logs:/var/lib/rundeck/logs --name rundeck-docker imaghonet/rundeck-docker
```

###Docker compose info
```bash
docker-compose up
```
See [docker-compose.yml] for details

###Logging
Log4j.properties is modified to log only to stdout (org.apache.log4j.ConsoleAppender)

###Environment variables

* User management (realm.properties)
```bash
RUNDECK_ADMIN_NAME = admin
RUNDECK_ADMIN_PASS = admin

RUNDECK_USER_NAME = user
RUNDECK_USER_PASS = user
```

* Java settings (profiles)
```bash
RUNDECK_JVM_XMX = 1024m 
RUNDECK_JVM_XMS = 256m 
RUNDECK_JVM_XX_MAX_PERM_SIZE = 256m
```

* Rundeck Config (rundeck-config.properties)
```bash
RUNDECK_LOGLEVEL_DEFAULT = INFO
RUNDECK_GRAILS_SERVER_URL = http://localhost:4440
```

* Framework properties (framework.properties)
```bash
FRAMEWORK_SERVER_NAME = localhost
FRAMEWORK_SERVER_HOSTNAME = localhost
FRAMEWORK_SERVER_PORT = 4440
FRAMEWORK_SERVER_URL = http://localhost:4440
FRAMEWORK_SERVER_USERNAME = admin
FRAMEWORK_SERVER_PASSWORD = admin
```