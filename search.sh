#!/bin/bash
#Last Modified 31 August, 2016
#Author: Aimee Tagle 

#This script goes through all of the Neopets Caption Contest entries to find a particular one based on a term
#e.g. a username, a phrase used in the caption
#It returns the contest number where the phrase appears

CURRENT_PAGE=".currentPage"
function enterSearch(){
	echo -e "Welcome to the Neopets Caption Contest Search. Please enter your search: "
	read searchTerm
	echo -e "What earliest contest it can be in?"
	read first
	echo -e "What latest contest it can be in?"
	read end
	echo "Searching for $searchTerm... Please wait"
	search $searchTerm $first $end
}

function search(){
#parameter $1 is the search term
#parameter $2 is the number of contests
	count=0
	for (( i=$2; i<=$3; i++ ));
	do
		echo `lynx -dump "http://www.neopets.com/games/caption/caption_archive.phtml?place=$i"` >$CURRENT_PAGE
		if [[ `grep -c "$1" "$CURRENT_PAGE"` -ne 0 ]]
		then
			echo $i
			count=$((count + 1))
		fi
	done
	echo "Done. Found $count results containing $searchTerm. Do you wish to try another search? (y to continue with new search)"
	read response
	if [$response -e "y"]
	then
		enterSearch
	else
		exit
	fi
}

echo >CURRENT_PAGE
enterSearch
