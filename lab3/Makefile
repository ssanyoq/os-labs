
default: 
	mkfifo fifo5

.PHONY: clear
clear:
	rm -rf test
	rm report.txt
	crontab -r
	killall 4-gen.bash
	rm fifo5
	rm pid.txt

killall:
	killall 4-gen.bash
