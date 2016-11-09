#!/bin/bash

# Load env
. env.sh

# Determine with which project to begin
FIRST_PROJECT="fcrepo-build-tools"
if [ ! -z "$1" ] ; then
  FIRST_PROJECT="$1"

  found=0
  for p in $PROJECTS; do
    if [ $p == $FIRST_PROJECT ]; then
      found=1
    fi
  done

  if [ $found == "0" ]; then
    echo "Invalid arg: $FIRST_PROJECT"
    echo "Try one of the following: $PROJECTS"
    exit 1
  fi
fi

# Display branch of each project
for x in $PROJECTS; do

  if [ $FIRST_PROJECT == $x ] ; then
    start=true
  fi

  if [ ! -z "$start" ] ; then
    cd ${BASE_DIR}/$x ;
    echo -n "$x => " ;
    echo `git status`
  fi
done

echo "SUCCESS!"
