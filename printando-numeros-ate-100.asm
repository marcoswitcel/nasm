SECTION .data
mensagem db 'ola mundo', 0Ah, 0h

SECTION .text
global _start

printa_mensagem_padrao:
    push edx
    push ecx
    push ebx
    push eax
    mov edx, 10
    mov ecx, mensagem
    mov ebx, 1
    mov eax, 4
    int 80h
    pop eax
    pop ebx
    pop ecx
    pop edx
    ret

printa_char:
    push edx
    push ecx
    push ebx
    push eax
    mov edx, 1
    mov ecx, esp
    mov ebx, 1
    mov eax, 4
    int 80h
    pop eax
    pop ebx
    pop ecx
    pop edx
    ret

_start:
    call printa_mensagem_padrao    
    mov ecx, 11
loop:
    dec ecx,
    mov eax, ecx
    dec eax
    push eax
    add eax, 48
    call printa_char
    mov eax, 0Ah
    call printa_char
    pop eax
    cmp eax, 0
    jnz loop 


exit:
    mov ebx, 0
    mov eax, 1
    int 80h