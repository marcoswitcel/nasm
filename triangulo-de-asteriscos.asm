
SECTION .data
asterisk db '*'  ; asterisco
linefeed db  0Ah ; linefeed

SECTION .text
global _start:


print_char:
  push edx
  push ecx
  push ebx
  push eax
  
  mov edx, 1        ; número de bytes para escrever
  mov ecx, eax ; memory address
  mov ebx, 1        ; stdout
  mov eax, 4        ; opcode `sys_write` 
  int 80h
  
  pop eax
  pop ebx
  pop ecx
  pop edx
  ret

exit: ; Chama `sys_exit` com parâmetro 0 para representar sucesso na operação
  mov ebx, 0
  mov eax, 1
  int 80h
  ret


_start:
  mov ebx, 0
inc:
  inc ebx
  mov eax, ebx
  cmp eax, 20
  jz terminated
  jmp loop
  
loop:
  push eax
  mov eax, asterisk
  call print_char
  pop eax
  dec eax
  cmp eax, 0
  jnz loop
  push eax
  mov eax, linefeed
  call print_char
  pop eax
  jmp inc

terminated:
  mov eax, linefeed
  call print_char

  call exit
