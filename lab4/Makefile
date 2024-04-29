.PHONY: reset
reset: 
	make clean
	make test

.PHONY: clean
clean:
	rm trash.log 
	rm -rf trash
	make clean_test

.PHONY: clean_test
clean_test:
	rm test*

.PHONY: test
test:
	touch test\;name
	touch test\'name
	touch test1
	touch test2
	touch 'test	name'
