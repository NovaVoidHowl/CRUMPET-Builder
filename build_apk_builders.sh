#!/bin/bash

echo Building 32bit APK builder
docker build --pull --rm -f "./docker-files/dockerfile-32bit" -t crumpet_builder_32bit_kde:latest "." > /dev/null 2>&1
echo Building 64bit APK builder
docker build --pull --rm -f "./docker-files/dockerfile-64bit" -t crumpet_builder_64bit_kde:latest "." > /dev/null 2>&1

echo "================================================="
echo "=              docker images built              ="
echo "================================================="