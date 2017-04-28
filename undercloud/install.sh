#!/bin/bash

export GIT_EMAIL=${GIT_EMAIL:="rbrady@redhat.com"}
export GIT_USER_NAME=${GIT_USER_NAME:="Ryan Brady"}
export GERRIT_USER_NAME=${GERRIT_USER_NAME:="rbrady"}

sudo yum install -y python-virtualenv python-pip wget gcc vim openssh-devel openssl-devel
sudo pip install git-review

if [ ! -f ~/venv ]; then
    virtualenv ~/venv
fi

source ~/venv/bin/activate
pip install -U pip setuptools

git config --global user.email $GIT_EMAIL
git config --global user.name $GIT_USER_NAME
git config --global --add gitreview.username $GERRIT_USER_NAME

~/tripleo-util/dotfiles/install.sh
