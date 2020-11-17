#!/bin/bash
if [[ $1 == "" ]]; then 
	ACTION="enable"
	echo "Using default action: $ACTION"
elif [[ $1 != "enable" && $1 != "disable" ]]; then
	echo "usage: $0 {enable|disable}"
	exit -1
else
	ACTION=$1
fi

NAME="`pwd | iconv -t ascii//TRANSLIT | sed -r s/[^a-zA-Z0-9]+/-/g | sed -r s/^-+\|-+$//g | tr A-Z a-z`:local"
docker build -t $NAME .
docker run --rm --privileged $NAME $ACTION
