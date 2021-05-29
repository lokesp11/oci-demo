#!/bin/sh
sudo docker run  -p 8080:8080 -ti --rm  -v /var/log/app3/:/usr/local/tomcat/logs lokeshp11/project
