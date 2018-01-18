#!/bin/bash -e
cd /opt

unzip /opt/dist.zip
rm /opt/dist.zip

if [ -d "/opt/dist" ]
then
  echo "Package was installed as /opt/dist, not moving."
else
  mv /opt/${artifactName} /opt/dist
fi

if [ ! -f /opt/dist/bin/d61plus-expert-connect-api ]; then
  echo "Executable is not at the right spot."
  exit 1
fi