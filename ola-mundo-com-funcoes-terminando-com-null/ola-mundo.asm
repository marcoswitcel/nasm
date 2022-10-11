; Inclusão
%include 'funcoes.asm'

SECTION .data
msg1 db 'Primeira mensagem!', 0Ah, 0h ; String terminada com null (0h)
msg2 db 'Segunda mensagem!', 0Ah, 0h  ; String terminada com null (0h)

SECTION .text
global _start

_start:
  mov eax, msg1
  call sprint

  mov eax, msg2
  call sprint

  call quit

