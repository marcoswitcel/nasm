SECTION .data
mensagem db 'ola mundo', 0Ah, 0h

SECTION .text
global _start

printa_integer:
    push eax   ; Preâmbulo
    push ecx
    push edx
    push esi
    mov ecx, 0 ; Inicializando ECX para 0
push_chars_loop:
    inc ecx ; Incrementando contador de chars que foram empurrados para a stack
    mov edx, 0  ; resetnado EDX
    mov esi, 10 ; movendo 10 para o ESI
    idiv esi    ; dividindo EAX por ESI, armazenando a quantidade de vezes que EAX coube em ESI dentro de EAX e armazenando o resto em EDX
    add edx, 48 ; adicionado 48 ao inteiro armazenado em EDX, que agora sabemos estar entre 0 e 9, portanto adicionando 48 teremos o código do seu char na tabela ASCII 
    push edx
    cmp eax, 0  ; ainda conseguimos dividí-lo?
    jnz push_chars_loop
printa_char_loop:
    dec ecx   ; decrementa o contador criado anteriormente
    pop eax
    call printa_char
    cmp ecx, 0
    jnz printa_char_loop
    pop esi
    pop edx
    pop ecx
    pop eax
    ret

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
    mov eax, 0
loop:
    inc eax
    push eax
    call printa_integer
    mov eax, 0Ah
    call printa_char
    pop eax
    cmp eax, 100
    jnz loop 


exit:
    mov ebx, 0
    mov eax, 1
    int 80h
