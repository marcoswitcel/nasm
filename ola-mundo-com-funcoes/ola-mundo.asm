; include
%include 'funcoes.asm'

SECTION .data
msg1 db 'ola mundo', 0Ah
msg2 db 'ola mundo2', 0Ah

SECTIOn .text
global _start

_start:
  mov eax, msg1
  call sprint

  mov eax, msg2
  call sprint

  call quit
