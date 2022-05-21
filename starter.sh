#!/bin/sh

/bin/bash /configure.sh > /dev/null 2>&1 &

/bin/bash /usr/local/tomcat/bin/catalina.sh run
