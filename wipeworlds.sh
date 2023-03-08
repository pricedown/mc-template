#!/usr/bin/env bash

shopt -s globstar extglob	
echo "Doing this will delete the world permanently."
read -r -p "Are you sure? [y/N] " response
if [[ "${response,,}" =~ ^(yes|y)$ ]]
then
	rm -r world*/!(datapacks)
fi
