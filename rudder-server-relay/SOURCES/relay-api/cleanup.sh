#!/bin/sh

# remove all files and their metadata in BASEDIR that have expired

BASEDIR="/var/rudder/shared-files"
date=$(date +%s)
find "${BASEDIR}" -type f -name '*.metadata' | xargs grep 'expires=' | sed 's/^\(.*\).metadata:expires=/\1 /' |
while read f d
do
  if [ ${date} -gt ${d} ]
  then
    echo rm "${f}" "${f}.metadata"
  fi
done
