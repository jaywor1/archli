#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ENDS=00
echo "Kolikata hodina?"
read HODINA
if [ $HODINA -eq 1 ]
then
	ENDH=15
	ENDM=45
fi
if [ $HODINA -eq 2 ]
then
	ENDH=16
	ENDM=40
fi
if [ $HODINA -eq 3 ]
then
	ENDH=17
	ENDM=45
fi
if [ $HODINA -eq 4 ]
then
	ENDH=18
	ENDM=40
fi
if [ $HODINA -eq 5 ]
then
	ENDH=19
	ENDM=35
fi
if [ $HODINA -eq 6 ]
then
	ENDH=20
	ENDM=30
fi 
while true
do
	TIME=$(date +%H%M%S) 
	HOURS=$(date +%H)
	MINUTES=$(date +%M)
	SECONDS=$(date +%S)
	HOURS=$(expr $ENDH - $HOURS)
	MINUTES=$(expr $ENDH + $HOURS*60 - $MINUTES)
	if [ $SECONDS -gt 0 ]
	then
		SECONDS=$(expr 60 - $SECONDS)
		MINUTES=$(expr $MINUTES - 1)
	fi
	if [ $MINUTES -gt $ENDM ]
	then
		MINUTES=$(expr 60 - $MINUTES + $ENDM)
	fi 
	if [ $MINUTES -lt $ENDM ]
	then
		MINUTES=$(expr $ENDM - $MINUTES)
	fi
	
	#echo $END-$TIME
	#let COUNTDOWN=$END-$TIME	
	#let MINUTES=$COUNTDOWN/60
	#let COUNTDOWN=$COUNTDOWN-$MINUTES*40
	#SECONDS=$(expr $COUNTDOWN % 60)
        #let MINUTES=$COUNTDOWN/60
	#echo $END-$TIME=$COUNTDOWN
	#echo $MINUTES
	#echo $SECONDS
	echo -e "[     ${GREEN}OK${NC}     ]: $MINUTES minutes and $COUNTDOWN seconds left"
	sleep 1
	if [ $COUNTDOWN -eq 0 ]
	then
		break;
	fi
done	
while true
do
	echo -e "[    ${RED}ERROR${NC}   ] KONEC HODINY"
done

