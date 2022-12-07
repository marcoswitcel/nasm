SECTION .data
mensagem db 'ola mundo', 0AH

SECTION .text
global _start

_start:

    mov edx, 10           ; número de bytes para escrever
    mov ecx, mensagem     ; endereço referenciado por 'mensagem'
    mov ebx, 1            ; stdout
    mov eax, 4            ; opcode 4 sys_write
    int 80h               ; Kernel call
_exit:
    mov ebx, 0            ; reportando 0 como erro status
    mov eax, 1            ; opcode 1 sys_exit
    int 80h               ; Kernel call
