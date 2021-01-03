main: printfile.asm
	nasm -f elf32 printfile.asm -o printfile.o
	ld -m elf_i386 printfile.o -o printfile

clean:
	rm *.o
