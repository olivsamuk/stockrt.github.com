#!/bin/bash

WD=$(basename $(pwd))
if [[ "$WD" != "site" ]]
then
    echo "You must be in the \"site\" directory to run $0"
    exit 1
fi

FROM_SITE=$(find . -maxdepth 1 -mindepth 1 | cut -d/ -f2-)
for E in $FROM_SITE
do
    echo "About to delete: ../$E"
done
echo "About to delete: ../p ../page[0-9]* ../20??"
echo "About to delete: ../*.sh"
if [[ "$1" != "ok" ]]
then
    echo "Continue? (enter)"
    read x
fi

for E in $FROM_SITE
do
    rm -rf ../$E
done
rm -rf ../p ../page[0-9]* ../20??

jekyll ../ || exit 1

rm -f ../*.sh
