
all:
	gcc -framework Foundation main.m -o notify

clean:
	rm notify
	rm -rf build