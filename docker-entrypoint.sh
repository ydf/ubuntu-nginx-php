#!/bin/bash
mkdir -p /var/run/sshd
p=`cat /dev/urandom | tr -dc "a-zA-Z0-9_+\~\!\@\#\$\%\^\&\*\(\)"| fold -w 12 |head -n 1` 
echo -e "$p\n$p" |passwd sshd && echo $p