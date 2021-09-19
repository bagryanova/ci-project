#!/bin/bash

mkdir /reports
echo "<!DOCTYPE html><html><head><title>Test results by commit</title></head><body>" > /reports/index.html

/astminer.sh
/morphia.sh

echo "</body></html>" >> /reports/index.html

echo "Starting server with reports"
nginx -c /etc/nginx/nginx.conf
