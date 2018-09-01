#!/usr/bin/env bash

monitorfile=readme.md

git commit -m 'start' $monitorfile
git push origin
lastsize=$(du -b $monitorfile | awk '{print($1)}')
while [ true ]
do
    cursize=$(du -b $monitorfile | awk '{print($1)}')
    if [ $cursize -ne $lastsize ]; then
	echo $(date), $cursie, $lastsize
	git commit -m 'update' $monitorfile
        git push origin
        lastsize=$cursize
    fi
    sleep 10
done
