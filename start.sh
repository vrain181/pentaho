#!/bin/sh

pentaho-server/start-pentaho.sh

#while true; do sleep 2; done

tail -f pentaho-server/tomcat/logs/catalina.out