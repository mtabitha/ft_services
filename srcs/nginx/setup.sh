#!/bin/sh

ssh-keygen -A 
adduser -D mtabitha 
echo "mtabitha:1234" | chpasswd

/usr/bin/supervisord -c /etc/supervisord.conf


