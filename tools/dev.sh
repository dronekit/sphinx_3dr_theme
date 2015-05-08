#!/bin/bash

echo "Starting dev env..."
# go to source directory
cd /vagrant
# start grunt dev process
echo "scss process"
echo "watch process"
echo "sphinx build starting"
echo "server started"
grunt
echo "server closed"
echo "watch terminated"
echo "Complete."
