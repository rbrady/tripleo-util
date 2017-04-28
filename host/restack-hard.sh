#!/bin/bash
set -eux
set -o pipefail

export TRIPLEO_UTIL_REPO=${TRIPLEO_UTIL_REPO:="https://github.com/rbrady/tripleo-util.git"}

~/tripleo-util/host/teardown.sh;
# http://i1.kym-cdn.com/photos/images/facebook/000/511/991/3a5.jpg
find . ! -name 'tripleo-util' -type d -exec rm -rf {} +;
~/tripleo-util/update.sh;
git clone $TRIPLEO_UTIL_REPO;
~/tripleo-util/host/install.sh;
