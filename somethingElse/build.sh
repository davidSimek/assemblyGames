nasm -f elf64 main.asm -o program.o
gcc -nostartfiles -o program program.o
