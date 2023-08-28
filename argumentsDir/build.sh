nasm -f elf64 arguments.asm -o arguments.o
gcc -nostartfiles -o arguments arguments.o
