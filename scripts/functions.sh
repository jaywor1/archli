#!/bin/bash

function echo_install {
	echo -e "[${YELLOW}  Install  ${NC}]: $1"
}

function echo_update {
	echo -e "[${CYAN}  Update  ${NC}]: $1"
}

function echo_info {
	echo -e "[${BROWN}  Info  ${NC}]: $1"
}

function echo_config {
	echo -e "[${BLUE}  Config  ${NC}]: $1"
}

function echo_ok {
	echo -e "[${GREEN}  O.K  ${NC}]: $1"
}

function echo_error {
	echo -e "[${GREEN}  ERROR  ${NC}]: $1"
}

archchroot(){
	archchroot /mnt $1
}