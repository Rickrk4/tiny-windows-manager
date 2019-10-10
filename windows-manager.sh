#!/bin/bash

function heigth () { 
wmctrl -d | grep '*' | sed -e 's/*.DG: //g' | sed -e 's/VP:.*//g' | sed -e 's/x*. //' | sed -e 's/.*x//g' | sed -e 's/ //g' 
}
 
function width  { 
 wmctrl -d | grep '*' | sed -e 's/*.DG: //g' | sed -e 's/VP:.*//g' | sed -e 's/x*. //' | sed -e 's/x.*//g' | sed -e 's/ //g' 
}


function left () {
	unmaximixe

	wmctrl -r :ACTIVE: -e 0,0,0,$(($(width)/2)),705
	wmctrl -r :ACTIVE: -b add,maximized_vert
}

function right () {
unmaximixe
wmctrl -r :ACTIVE: -e 0,683,0,680,705
wmctrl -r :ACTIVE: -b add,maximized_vert
}

function maximize () {
	wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
}

function unmaximixe () {
	wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
}

function minimize () {
wmctrl -r :ACTIVE: -b add,hidden
}


case $1 in
	"left")
		left;;
	"right")
		right;;
	"maximize")
		maximize;;
	"minimize")
		minimize;;
	*)
		echo "usage $0 [left|right|maximize|minimize]";;
esac
