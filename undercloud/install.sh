#!/bin/bash
set -eux
set -o pipefail

if [[ $USER != "stack" ]]; then
  echo "Must be run as stack user.";
	exit 1;
fi

sudo yum upgrade -y;
sudo yum install -y ack vim libffi-devel libssl-devel openssl-devel python-devel;

rm -rf ~/tripleo-ci
git clone https://github.com/openstack-infra/tripleo-ci.git ~/tripleo-ci

~/tripleo-ci/scripts/tripleo.sh --repo-setup
~/tripleo-ci/scripts/tripleo.sh --undercloud

sudo systemctl restart openstack-ironic-*;

~/tripleo-ci/scripts/tripleo.sh --overcloud-images

source ~/stackrc;
~/tripleo-util/undercloud/openstack-register-nodes.sh

wget https://bootstrap.pypa.io/get-pip.py;
sudo python get-pip.py;
sudo pip install virtualenv git-review;

git config --global user.email "dougal@redhat.com"
git config --global user.name "Dougal Matthews"
git config --global --add gitreview.username "dougal"

git clone https://github.com/openstack/python-tripleoclient.git;
git clone https://github.com/openstack/tripleo-common.git;
git clone https://github.com/openstack/mistral.git;
git clone https://github.com/d0ugal/python-tripleodash.git

virtualenv ~/venv

~/tripleo-util/undercloud/tripleodash-install.sh
~/tripleo-util/post-update.sh
