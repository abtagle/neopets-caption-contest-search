#!/bin/bash
#Last Modified 31 August, 2016
#Author: Aimee Tagle 

#This script goes through all of the Neopets Caption Contest entries to find a particular one based on a term
#e.g. a username, a phrase used in the caption

function enterSearch(){
	echo -e "Welcome to the Neopets Caption Contest Search. Please enter your search: "
	read searchTerm
	echo "What is the number of the lastest Caption Contest?"
	echo "Searching for $searchTerm... Please wait"
	
}

function search(){

}

enterSearch
