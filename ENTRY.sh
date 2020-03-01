#!/bin/bash
#set -e

if [ "${DOMAIN}" == "**None**" ]; then
    echo "Please specify DOMAIN"
    exit 1
fi

/bin/sed -i "s/{{domain}}/${DOMAIN}/g" /etc/apache2/sites-enabled/zmirror-google-http.conf
/bin/cat /var/www/google/config.py

case "$1" in
start)
	exec /usr/sbin/apache2ctl -D FOREGROUND
	;;
bash)
	exec /bin/bash
	;;
*)
	echo "Wrong parameters, try bash"
	;;
esac
