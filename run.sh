#!/bin/bash
set -e

curl -fsSL 'https://iplist.opencck.org/?format=text&data=cidr4' -o origin

sort -u origin <(sed 's/#.*//; s/[[:space:]]*$//' added) | grep -v -F -x -f removed | sed '/^$/d' > origin.tmp
mv origin.tmp origin
