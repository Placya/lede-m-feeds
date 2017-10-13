#!/bin/bash

DIR=`ls .`
for dir in ${DIR};do
	if [ -d ${dir} ];then
		if [ -d $dir/.git ]; then
			BRANCH=`git symbolic-ref --short HEAD`
			COMMIT=``
			echo 'yes!'
		else
			echo 'nope!'
		fi
	fi
done
