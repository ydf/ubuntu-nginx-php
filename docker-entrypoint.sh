#!/bin/bash
set -e

if [ -z "$ROOT_PASSWORD" ]; then
	echo >&2 'error: set ROOT_PASSWORD please'
	exit 1
fi

# set root password and make root loginable
echo "root:$ROOT_PASSWORD" | chpasswd
mkdir -p /var/run/sshd
sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
echo "export VISIBLE=now" >> /etc/profile
exec "$@"

