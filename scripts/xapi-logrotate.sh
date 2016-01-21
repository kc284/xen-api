#!/bin/sh

/usr/sbin/logrotate /etc/xapi.d/xapi-logrotate.conf
EXITVALUE=$?
if [ $EXITVALUE != 0 ]; then
    /usr/bin/logger -t $0 "ALERT exited abnormally with [$EXITVALUE]"
fi
exit 0
