#!/bin/bash
set -e

if [ -z "$ROOT_PASSWORD" ]; then
	echo >&2 'error: set ROOT_PASSWORD please'
	exit 1
fi

# set root password and make root loginable
echo "root:$ROOT_PASSWORD" | chpasswd
mkdir -p /var/run/sshd
mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config && sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config