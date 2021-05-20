#!/usr/bin/env bash

# author: Rodolpho
# describe: Get data youtube video and channel details
#version: 0.1
#license: MIT license

#titulo: grep '<title>' nome.html | sed 's/<[^>]*>//g' | sed 's/ - You.*//g'

#views: grep 'watch-view-count' nome.html | sed 's/<[^>]*>//g'
#likes: grep 'like-button-render-like-button' nome.html | sed -n 1p | sed 's/<[^.]*>//g'
#dislikes: grep 'like-button-render-dislike-button' nome.html | sed -n 1p | sed 's/<[^.]*>//g'


function youtube(){
	
	local _video=$(mktemp)
	local _channel=$(mktemp)

	wget "$1" -O "$_video" 2>/dev/null

	local _title=$(grep '<title>' "$_video" | sed 's/<[^>]*>//g' | sed 's/ - You.*//g')
	local _views=$(grep 'watch-view-count' "$_video" | sed 's/<[^>]*>//g')
	local _likes=$(grep 'like-button-render-like-button' "$_video" | sed -n 1p | sed 's/<[^.]*>//g')
	local _dislikes=$(grep 'like-button-render-dislike-button' "$_video" | sed -n 1p | sed 's/<[^.]*>//g')

	echo "Titulo: $_title"
	echo "Views: $_views"
	echo "Likes: $_likes"
	echo "Disikes: $_dislikes"
}
youtube "$1"