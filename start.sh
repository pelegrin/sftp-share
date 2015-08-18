#!/bin/bash

if ( id ${USER} ); then
    echo "INFO: User ${USER} already exists"
else
    echo "INFO: User ${USER} does not exists, we create it"
    if [ -z "${PASS}" ]; then
        PASS="$(echo `</dev/urandom tr -dc A-Za-z0-9 | head -c256`)"
    fi
    ENC_PASS=$(perl -e 'print crypt($ARGV[0], "password")' ${PASS})
    useradd -d /data -m -p ${ENC_PASS} -u ${USER_UID} -s /bin/sh ${USER}
    cat /home/${USER}/.ssh/keys/* >> /home/${USER}/.ssh/authorized_keys
    chown ${USER} /home/${USER}/.ssh/authorized_keys
    chmod 600 /home/${USER}/.ssh/authorized_keys
fi

exec /usr/sbin/sshd -D
