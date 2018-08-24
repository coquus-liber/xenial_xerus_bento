#!/bin/sh

mv /tmp/chef /etc/chef && \
chown -R root:root /etc/chef && \
chef-client && \
touch /vagrant/provisioned && \
poweroff

