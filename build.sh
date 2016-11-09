#!/bin/bash

# Load env
. env.sh

# Determine with which project to begin
FIRST_PROJECT="fcrepo-build-tools"
if [ ! -z "$1" ] ; then
  FIRST_PROJECT="$1"

  found=0
  for p in $PROJECTS; do
    if [ "$p" == "$FIRST_PROJECT" ]; then
      found=1
    fi
  done

  if [ $found == "0" ]; then
    echo "Invalid arg: $FIRST_PROJECT"
    echo "Try one of the following: $PROJECTS"
    exit 1
  fi
fi

# Build the projects
for x in $PROJECTS; do

  if [ $FIRST_PROJECT == $x ] ; then
    start=true
  fi

  if [ ! -z "$start" ] ; then
    echo "building $x" ;
    cd ${BASE_DIR}/$x ;
    if mvn clean javadoc:jar | grep "BUILD FAILURE" ; then 
      echo "$x failed javadoc:jar!"
      exit 1
    fi
    if mvn clean javadoc:test-aggregate | grep "BUILD FAILURE" ; then 
      echo "$x failed javadoc:test-aggregate!"
      exit 1
    fi

    if mvn clean install | grep "BUILD FAILURE" ; then 
      echo "$x failed clean install!"
      exit 1
    fi
  fi
done

echo "SUCCESS!"
