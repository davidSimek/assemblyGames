;-------------------------------------------------
; Program: arguments
; Purpose: To learn how to work with cli arguments
; Platform: x86_64, Linux
;-------------------------------------------------

section .data
    message db " is first argument", 0

section .text
global _start 

_start:
; print message
    call getFirstArgument
    mov rcx, rax
    call print

    mov rcx, message
    call print

; exit program
    call exit

getFirstArgument: ; argument -> rax
    mov rax, [rsp]
    cmp rax, 0
    je getFirstArgumentEnd
    mov rax, [rsp + 24] ; + 8 is count ; + 16 is name of command
getFirstArgumentEnd:
    ret

; rcx = string
print: ; prints into std out
    cmp rcx, 0
    je printEnd
    mov rbx, rcx

; figure out length
    call stringlength
    mov rdx, rax

; actual printing
    mov rax, 1
    mov rdi, 1
    mov rsi, rbx
    syscall
printEnd:
    ret

exit: ; exit program
    mov eax, 60
    xor edi, edi
    syscall

; rcx = string ; length -> rax
stringlength: ; return lengt of string up to 1024 bytes
    mov rax, 0 
stringlengthloophead:
    add rax, 1
    add rcx, 1
    cmp rax, 1024
    jg stringlengthloopend
    cmp byte [rcx], 0
    jne stringlengthloophead
stringlengthloopend:
    ret
