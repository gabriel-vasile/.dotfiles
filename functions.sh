#! /usr/bin/env bash

function backup_dot() {
	dot=$1
	bdir=$2

	if [[ ! -d "$bdir" ]] ; then
	    mkdir "$bdir"
	fi
	
	if [[ -f "$dot" && ! -L "$dot" ]] ; then
		mv "$dot" "$bdir"
	fi
}
export -f backup_dot