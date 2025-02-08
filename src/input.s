section .data
    text1 db "What is your name? "  ; asking for your name
    text2 db "Hello, "  ; greeting message followed by your name

section .bss
    name resb 32  ; reserve 32 bytes for user input

section .text
    global _start

_start:
    call _printText1
    call _getName
    call _printText2
    call _printName

    ; exit the program
    mov rax, 60
    mov rdi, 0
    syscall

_getName:
    ; get input from user
    mov rax, 0      ; syscall number for sys_read
    mov rdi, 0      ; file descriptor 0 (stdin)
    mov rsi, name   ; pointer to 'name' buffer
    mov rdx, 32     ; number of bytes to read
    syscall
    ret

_printText1:
    ; print "What is your name?"
    mov rax, 1      ; syscall number for sys_write
    mov rdi, 1      ; file descriptor 1 (stdout)
    mov rsi, text1  ; pointer to 'text1' string
    mov rdx, 19     ; length of the string
    syscall
    ret

_printText2:
    ; print "Hello, "
    mov rax, 1      ; syscall number for sys_write
    mov rdi, 1      ; file descriptor 1 (stdout)
    mov rsi, text2  ; pointer to 'text2' string
    mov rdx, 7      ; length of the string
    syscall
    ret

_printName:
    ; print the entered name
    mov rax, 1      ; syscall number for sys_write
    mov rdi, 1      ; file descriptor 1 (stdout)
    mov rsi, name   ; pointer to 'name' buffer
    mov rdx, 32     ; length of the string (maximum buffer size)
    syscall
    ret
