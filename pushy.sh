#!/bin/bash

DIR=`ls .`
for dir in ${DIR};do
	if [ -d ${dir} ];then
		if [ -d $dir/.git ]; then
			cd $dir
			BRANCH=`git rev-parse --abbrev-ref HEAD`
			COMMIT=`git rev-parse HEAD`
			REMOTE=`git config --get remote.origin.url`
			echo $REMOTE > REMOTE.txt
			echo $BRANCH > BRANCH.txt
			echo $COMMIT > COMMIT.txt
			rm -rf .git
			echo $dir' is ready for feed'
			cd ..
		else
			echo $dir' has been proceed'
		fi
	fi
done