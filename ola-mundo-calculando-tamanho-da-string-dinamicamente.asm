
SECTION .data
message db 'ola mundo', 0Ah ; 0Ah ou em outra notação 0x0A, significa linefeed, bom e velho enter


SECTION .text
global _start ; Ponto de entrada do programa, por padrão com o NASM deve set _start


_start:
  mov ebx, message ; move o endereço de `message` para dentro de EBX
  mov eax, ebx     ; move (copia) o endereço do endereço armazenado em EBX para EAX

nextchar:
  cmp byte [eax], 0 ; compara o valor (byte) referência por essa posição (valor atual de EAX) com zero
  jz finished       ; salta (jump) se a flag zero foi setada
  inc eax           ; incrementa EAX para referência o próximo caractere
  jmp nextchar      ; salta para a posição nomeada `nextchar`, nesse caso o loop continua

finished:
  sub eax, ebx ; realiza a operação de subtração para saber quantos bytes foram encontrados

  ; Chama o comando sys_write, opcode 4
  mov edx, eax      ; Número de caracteres a escrever
  mov ecx, message ; `message` contém o endereço aonde os caracteres estão armazenados
  mov ebx, 1       ; stdout
  mov eax, 4       ; opcode `sys_write`
  int 80h
  
  ; Chama o comando sys_exit, opcode 1
  mov ebx, 0 ; parâmetro adicional para o `sys_exit`, representando que não houve erros, 0 erros
  mov eax, 1 ; opcode para o comando `sys_exit`
  int 80h    ; chama o interrupt 80, que faz executar um sys call usando o opcode para saber qual função

