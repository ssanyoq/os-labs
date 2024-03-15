#! /bin/bash

OPTIONS_AMT=3

print_menu() {
	echo "Choose option:"
	echo "1 - Open Nano"
	echo "2 - Open Vim"
	echo "3 - Open Links"

	echo "0 - Quit this program"
	echo ""
}

print_menu
read option

regex="[0-$OPTIONS_AMT]"

while [[ $option != $regex ]]
do
	echo "Bad input, try again: "
	read option
done

case $option in
	"1")
	nano
	;;
	"2")
	vim
	;;
	"3")
	links
	;;
esac
