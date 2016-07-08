#!/bin/bash
# @Author: omitrowski
# @Date:   2016-07-08 23:04:53
# @Last Modified by:   omitrowski
# @Last Modified time: 2016-07-08 23:43:18

for file in $(ls /etc/rundeck/{framework.properties,log4j.properties,profile,realm.properties,rundeck-config.properties}); do
	/usr/local/bin/ep -v $file
done

. /etc/rundeck/profile

RUN_PROG="${JAVA_HOME:-/usr}/bin/java"
RUN_ARGS="${RDECK_JVM} -cp ${BOOTSTRAP_CP} com.dtolabs.rundeck.RunServer /var/lib/rundeck ${RDECK_HTTP_PORT}"
rundeck="${RUN_PROG} ${RUN_ARGS}"

# run as rundeck user
# su -s /bin/bash rundeck -c "$rundeck"

# run as root
$rundeck