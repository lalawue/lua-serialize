all : packer 

packer.so : packer.c
	gcc -Wall -g -o $@ -fPIC --shared $^

packer : lpacker.c
	gcc -Wall -g -o $@.so --shared $^ -I/usr/local/include -L/usr/local/bin -lluajit
