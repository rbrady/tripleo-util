#!/bin/bash
set -eux
set -o pipefail

~/venv/bin/openstack overcloud deploy --templates \
    -e ~/tripleo-util/local_resource_registry/wait_env.yaml
