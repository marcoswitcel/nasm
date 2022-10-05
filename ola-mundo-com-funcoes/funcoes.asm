;----------------------------------
; int slen(const char* cstring)
; retorna o comprimento da string
;----------------------------------
slen:
  push ebx
  mov ebx, eax

nextchar:
  cmp byte [eax], 0
  jz finished
  inc eax
  jmp nextchar

finished:
  sub eax, ebx
  pop ebx
  ret

;---------------------------------
; void sprint(const char* cstring
; não retorna nada
;---------------------------------
sprint:
  push edx
  push ecx
  push ebx
  push eax
  call slen

  mov edx, eax
  pop eax

  mov ecx, eax
  mov ebx, 1
  mov eax, 4
  int 80h

  pop ebx
  pop ecx
  pop edx
  ret

;-------------------
; void exit(void)
;-------------------
quit:
  mov ebx, 0
  mov eax, 1
  int 80h
  ret

