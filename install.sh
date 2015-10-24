#!/bin/sh

set -e

gitrawurl='https://raw.githubusercontent.com/barn/curlbrash/master/curlbrash'

if [ $(id -u) -ne 0 ]
then
    echo "Need to be root"
    exit 10
fi

echo "Really, this is what you're doing?"


curlloc="$(/usr/bin/which curl)"

if [ $? -ne 0 ]
then
    echo "Failed to find curl"
    exit 20
fi


tempfoo=`basename $0`
TMPFILE=`mktemp /tmp/${tempfoo}.XXXXXX` || exit 1

curl -s -L -o "${TMPFILE}" "${gitrawurl}"

mv "${curlloc}" "${curlloc}.orig"

sed -e "s^XXCURLLOCATIONXX^${curlloc}.orig^" <"${TMPFILE}" >"${curlloc}"
chmod 0555 "${curlloc}"
rm "${TMPFILE}"

echo "Irony complete. No more 'curl | sudo sh' for you!"

