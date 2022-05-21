#!/bin/sh

while true; do
  nc -z 0.0.0.0 8080
  res=$?
  echo "Server port 8080 code is " + $res
  if [[ "$res" == '0' ]]; then
    echo "Configure server…"
    java -jar /home/openam/ssoadmintools/openam-configurator-tool-14.6.4.jar -f /home/openam/ssoadmintools/openamconfig
    echo "Done."
    break
  fi
  sleep 1
done


