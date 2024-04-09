#! /bin/bash

mkdir test && {
	echo "catalog test was created successfully" > report.txt
	touch test/"aa" 
}

ping net_nikogo.ru || echo "Na net nikogo nikogo net" >> report.txt

