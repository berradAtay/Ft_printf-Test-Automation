# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    test.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ybichri <ybichri@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/12/14 09:39:59 by ybichri           #+#    #+#              #
#    Updated: 2020/03/08 21:07:56 by ybichri          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

# colors
GREEN="\033[92m"
RED="\033[91m"
MUTED="\033[1;30m"
RESET="\033[0m"
# sources directory
SRCS_DIR="." 

echo "${MUTED}TYPE TEST TEXT :${RESET}";
read test;
echo "${GREEN}TEST TEXT :${test}${RESET}" | tee -a tests ;
if [[ -z "$test" ]]; then
	cwd=$(pwd);
	cd  $SRCS_DIR;
	make || (echo "${RED}MAKEFILE FAILED${RESET}\n"  && exit);
	cd $cwd;
	if gcc main.c ${SRCS_DIR}/libftprintf.a -o out  2>log; then
		echo "${GREEN}COMPILATION SUCCESSFUL${RESET}";
		echo "${MUTED}RUNNING TEST";
		echo "--------------------------------------------------------------------------------${RESET}";
		./out | tee -a tests;
		rm -rf out ;
		cd  $SRCS_DIR;
		make fclean;
		cd $cwd;
		else
		echo "${RED}COMPILATION FAILED${RESET}\n";
	fi
else
	cwd=$(pwd);
	cd  $SRCS_DIR;
	make || (echo "${RED}MAKEFILE FAILED${RESET}\n"  && exit);
	cd $cwd;
	if gcc main.c ${SRCS_DIR}/libftprintf.a -D "TEST=$test" -o out  2>log; then
		echo "${GREEN}COMPILATION SUCCESSFUL${RESET}";
		echo "${MUTED}RUNNING TEST";
		echo "--------------------------------------------------------------------------------${RESET}";
		./out | cat -e | tee -a tests;
		rm -rf out ;
		cd  $SRCS_DIR;
		make fclean;
		cd $cwd;
		else
		echo "${RED}COMPILATION FAILED${RESET}\n";
	fi
fi