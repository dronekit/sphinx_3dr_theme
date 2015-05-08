#!/bin/bash

echo "Building assets"
# go to source directory
cd /vagrant
# start grunt dev process
grunt build
echo "Build complete"
