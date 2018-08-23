#!/bin/sh

mv /tmp/chef /etc/chef && \
chown -r root:root /etc/chef && \
chef-client && \
touch /vagrant/provisioned && \
poweroff

