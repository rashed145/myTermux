#!/usr/bin/bash

[ -f ~/.alock ] && exit 1
[ $# -eq 0 ] && exit 1
set -e
touch ~/.alock
trap 'rm ~/.alock &>/dev/null' EXIT INT TERM

d=$(apt-get -q=2 --print-uris "$@" 2>/dev/null)

[ -n "$d" ] && {
	u=$(echo "$d"|awk '{print $1"\n\tout="$2}'|tr -d "\'")
	menu=$(echo "$d"|awk '{ sub(/_.*/,"",$2); printf "%-34s%.3f%s\n",$2,$3/(1000*1000),"M"}')
	ts=$(echo "$menu"|awk 'BEGIN{sub(/M/,"",$2); s=0 } {s+=$2} END{ print s"M" }')

	printf "%s\n\nTOTAL%36s\n" "$menu" "$ts"
	read -e -n1 -p 'Proceed to Download? [Yn] ' yn
	[[ "$yn" = [Yy] ]]
	[ -n "$TERMUX_VERSION" ] && CACHE=/data/data/com.termux/cache/apt/archives
	read -e -p 'Custom download dir: ' dir
	[ -n "$dir" ] && mkdir -p "$dir" && test -w "$dir" && CACHE="$dir"
	aria2c -c -s 8 -x 10 -k 1M -j 5 -i <(echo "$u") -d "${CACHE:-/var/cache/apt/archives}" --header "Accept: */*"
}
[ -d "$dir" ] || yes|apt-get "$@"
