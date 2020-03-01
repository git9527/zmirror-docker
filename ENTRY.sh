#!/bin/bash
#set -e

if [ "${DOMAIN}" == "**None**" ]; then
    echo "Please specify DOMAIN"
    exit 1
fi

echo "Running with ${DOMAIN}, ${ANSWER}"
/bin/sed -i "s/{{domain}}/${DOMAIN}/g" /etc/apache2/sites-enabled/zmirror-google-http.conf
/bin/sed -i "s/{DOMAIN}/${DOMAIN}/g" /var/www/${MIRROR_NAME}/config.py
/bin/sed -i "s/{ANSWER_HASH}/${ANSWER_HASH}/g" /var/www/${MIRROR_NAME}/config.py
/bin/sed -i "s/{ANSWER}/${ANSWER}/g" /var/www/${MIRROR_NAME}/config.py

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
