#!/usr/bin/env zsh

STARTYEAR=2008
ENDYEAR=2018
CURRDATE=$(date +"%Y%m%d")

git init
for (( i = ((ENDYEAR - STARTYEAR) * 365) + ((ENDYEAR - STARTYEAR) / 4); i >= 0; i -= 1 )); do
	NEWDATE=$(date -d "-$i days" +"%Y%m%d")
	echo $i > temp
	sudo date -s $NEWDATE +"%Y%m%d" &> /dev/null
	for (( x = $RANDOM % 3; x >= 0; x -= 1)); do
		echo $x >> temp
		git add . &>/dev/null
		git commit -a -m "$i" &>/dev/null
		GIT_AUTHOR_DATE=$NEWDATE GIT_COMMITTER_DATE=$NEWDATE git commit --amend -m "$i"  &>/dev/null 
	done;
	sudo date -s $CURRDATE +"%Y%m%d" &> /dev/null
done;

