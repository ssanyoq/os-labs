#! /bin/bash

systemctl start atd
systemctl enable atd

at now + 2 minutes -f ./1.bash < /dev/null
tail -f report.txt -n 0
