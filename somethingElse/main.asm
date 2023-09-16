section .data
    message db "lol", 0

section .text
global _start

_start:
    mov rdi, message
    call strlen

    mov rdi, message
    mov rsi, rax
    call print

    call exit_program

strlen:
    ; rdi = string
    ; length of string => rax
    mov rax, 0
strlen_loop_head:
    inc rax
    cmp byte [rdi], 0
    jne strlen_loop_head
    ret

print:
    ; rdi = message pointer
    ; rsi = length of message
    mov rdx, rsi  ; length
    mov rsi, rdi  ; message
    mov rax, 1    ; sys_write
    mov rdi, 1    ; stdout
    syscall
    ret

exit_program:
    mov rax, 60
    xor rdi, rdi
    syscall
