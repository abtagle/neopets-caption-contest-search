#!/bin/bash
#Last Modified 31 August, 2016
#Author: Aimee Tagle 

#This script goes through all of the Neopets Caption Contest entries to find a particular one based on a term
#e.g. a username, a phrase used in the caption
#It returns the contest number where the phrase appears

function enterSearch(){
	echo -e "Welcome to the Neopets Caption Contest Search. Please enter your search: "
	read searchTerm
	echo "What is the number of the lastest Caption Contest?"
	read number
	echo "Searching for $searchTerm... Please wait"
	search $searchTerm $number
}

function search(){
#parameter $1 is the search term
#parameter $2 is the number of contests
	count = 0
	for i in $2;
	do
	currentPage = wget "http://www.neopets.com/games/caption/caption_archive.phtml?place=`$i`"
		if [ `grep -c "$1 "$currentPage"` -ne 0 ]
		then
			echo $1
			count = $(count + 1)
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

enterSearch
