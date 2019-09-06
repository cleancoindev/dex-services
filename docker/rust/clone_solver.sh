#!/usr/bin/env bash
set -e

# Authorize SSH Host
mkdir -p /root/.ssh
chmod 0700 /root/.ssh && \
ssh-keyscan gitlab.gnosisdev.com > /root/.ssh/known_hosts

# Copy SSH key
cp .ssh/id_rsa /root/.ssh/id_rsa
cp .ssh/id_rsa.pub /root/.ssh/id_rsa.pub

# Clone and install dependencies
git clone git@gitlab.gnosisdev.com:dfusion/batchauctions.git
cd batchauctions
git checkout v0.1
pip install -r requirements.txt