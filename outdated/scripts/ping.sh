#!/bin/bash

echo "ENTER WEB URL";
read STRING;
echo "[   LOG   ]: Entered string --> $STRING";

printf "\n";
echo "PING COMMAND";
echo "----------------------------------------------------------";

ping -c 1 $STRING;

printf "\n----------------------------------------------------------\n\n";

if [ $? -eq 0 ]
then
	echo "[   OK   ]: Ping command status";
else
	echo "[   ERROR   ]: Ping command status";
fi
