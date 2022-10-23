
SECTION .data
mensagem db 'programa que realiza adicao', 0Ah, 0h

SECTION .bss
memory: RESB 100 ; reserva 100 bytes

SECTION .text
global _start

sys_write:
  push edx
  push ecx
  push ebx
  push eax
  mov edx, ebx ; quantos bytes ler
  mov ecx, eax ; da onde ler
  mov ebx, 1 ; pra onde - STDOUT
  mov eax, 4 ; kernel opcode  4 SYS_WRITE
  int 80h    ; invoca a interrupação
  pop eax
  pop ebx
  pop ecx
  pop edx
  ret

write_char:
  push ebx
  push eax
  mov ebx, 1
  mov eax, esp
  call sys_write
  pop eax
  pop ebx
  ret

_start:
  mov ebx, 28
  mov eax, mensagem
  call sys_write

  mov edx, 1
  mov ecx, memory
  mov ebx, 0
  mov eax, 3
  int 80h

  movzx eax, byte [memory]
  add eax, 1
  call write_char
  mov eax, 0Ah
  call write_char 

quit:
  mov ebx, 0 ; nenhum erro encontrado
  mov eax, 1 ; SYS_EXIT
  int 80h
  
