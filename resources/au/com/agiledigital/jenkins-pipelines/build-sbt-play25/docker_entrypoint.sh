#!/bin/bash -x
set -e

if [ -f "/opt/dist/RUNNING_PID" ]
then
   rm /opt/dist/RUNNING_PID
fi

export EXTERNAL_IP=`ip addr show eth0 | grep "inet\b" | awk '{print \$2}' | cut -d/ -f1`

echo "Got external ip [\$EXTERNAL_IP]."

echo "Environment start"
env
echo "Environment end"

echo "/etc/hosts start"
cat /etc/hosts
echo "/etc/hosts end"

# Set the timezone if TZ is set and different to CONTAINER_TIMEZONE
if [ "\$TZ" != "" -a "\$TZ" != "\$CONTAINER_TIMEZONE" ]; then
   cp /usr/share/zoneinfo/\${TZ} /etc/localtime && echo "\${TZ}" >  /etc/timezone && echo "Container timezone set to: \$TZ"
else
   echo "Container timezone not modified defaulting to \${CONTAINER_TIMEZONE}"
   TZ="\$CONTAINER_TIMEZONE"
   export TZ
fi
exec "/opt/dist/bin/d61plus-expert-connect-api" "-Dconfig.resource=combined.conf" "-Dplay.evolutions.db.default.autoApply=true" "-DapplyEvolutions.default=true" "\$@"