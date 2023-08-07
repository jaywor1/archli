#!/bin/bash

function echo_install {
	echo -e "${WHITE}[${YELLOW}  Install  ${WHITE}]: ${1}${NC}"
}

function echo_update {
	echo -e "${WHITE}[${CYAN}  Update  ${WHITE}]: ${1}${NC}"
}

function echo_info {
	echo -e "${WHITE}[${BROWN}  Info  ${WHITE}]: ${1}${NC}"
}

function echo_config {
	echo -e "${WHITE}[${BLUE}  Config  ${WHITE}]: ${1}${NC}"
}

function echo_ok {
	echo -e "${WHITE}[${GREEN}  O.K  ${WHITE}]: ${1}${NC}"
}

function echo_error {
	echo -e "${WHITE}[${RED}  ERROR  ${WHITE}]: ${1}${NC}"
}

archchroot(){
	arch-chroot /mnt ${1}
}
