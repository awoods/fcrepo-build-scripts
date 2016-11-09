Simple scripts for building Fedora modules

Usage
=====

An assumption of these scripts is that all of the Fedora git projects reside within the same base directory.
Update the `env.sh` script to define your specific `BASE_DIR`.

Each of the scripts can be run without providing any arguments and will then be executed for all of the modules defined in `env.sh`.

branches.sh
-----------

This script displays the name of the current branch for each of the modules

build.sh
--------

This script runs `mvn clean install` on each of the modules defined in `env.sh`.

Additionally, this script checks that the javadocs are correct according to the expectations required for releasing the modules.

If one of the module names is provided as an argument, the script proceeds from that module according to the order of modules defined in `env.sh`.

force-master-or.sh
------------------

This script forces each of the modules to checkout their master branch, followed by a `git pull`.

If one of the module names is provided as an argument, the script proceeds from that module according to the order of modules defined in `env.sh`.

Optionally, a second argument can be provided that names a branch to be checked out instead of the default master branch.
This is helpful when all of the modules have the same named branch, such as when building a release candidate set.
