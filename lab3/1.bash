#! /bin/bash
datetime=$(date +"%b_%d_%H:%M")
mkdir test && {
	echo "catalog test was created successfully" > report.txt
	touch test/$datetime
}

ping net_nikogo.ru || echo "$datetime: Na net nikogo nikogo net" >> report.txt

