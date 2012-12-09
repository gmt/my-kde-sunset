#!/bin/bash

case $1 in
	--version)
		fribidi --version | head -n 1 | sed 's/^.*\s//'
		;;
	--libs)
		pkg-config --libs fribidi
		;;
	--cflags)
		pkg-config --cflags fribidi
		;;
	*)
		echo '$0: $1: wtf?' >&2
		exit 1
		;;
esac
