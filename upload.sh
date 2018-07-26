#!/usr/bin/env bash

monitorfile=readme.md

lastsize=$(du -b $monitorfile | awk '{print($1)}')
while [ true ]
do
    cursize=$(du -b $monitorfile | awk '{print($1)}')
    if [ $cursize -ne $lastsize ]; then
	echo $(date), $cursie, $lastsize
	git commit -m 'fix' $monitorfile
        git push origin
        lastsize=$cursize
    fi
    sleep 10
done
