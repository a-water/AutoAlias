#!/bin/bash

newAliasList=()

FILES=$1/*
for f in $FILES
do
	aliasName=$(basename "$f")
	absPath=$(cd $f; pwd)
	newAliasList+=("alias $aliasName=\"cd $absPath\"");
done

bashFile="$HOME/.bash_profile"

for a in "${newAliasList[@]}"
do
	if ! grep -Fxq "$a" $bashFile
	then
		echo $a >> $bashFile
	fi
done