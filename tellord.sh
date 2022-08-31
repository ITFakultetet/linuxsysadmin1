#! /bin/bash
if [ ! -f /usr/local/bin/tellord ]; then 
	echo Installerer programmet....
	sudo cp tellord.sh /usr/local/bin/tellord
	
	echo $'\e[1;31m'Bruk:$'\e[1;37m' Tast inn kommanoden $'\e[1;33m'tellord$'\e[0m' og gi et filnavn som parameter$'\e[0m'
	exit 0;
fi
	
if [ $# -eq 1 ]; then 


	cat $1  | sed 's/\s/\n/g' \
		| sed 's/[[:punct:]]\|[0-9]//g' \
		| tr '[:upper:]' '[:lower:]' \
		| sort \
		| uniq -c \
		| sort -n -r \
		| tail -n +2 \
		> forekomster_av_ord_i_$1


	echo Det er $'\e[1;33m'`cat forekomster_av_ord_i_$1 | wc -l` $'\e[0m'unike ord i $'\e[1;31m'$1.
	echo $'\e[1;37m'Se dem i filen: $'\e[1;31m'forekomster_av_ord_i_$1$'\e[0m'
else

	echo $'\e[1;31m'Bruk:$'\e[1;37m' Gi et filnavn som parameter$'\e[0m'

fi


