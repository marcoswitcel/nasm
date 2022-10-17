; Hello World Program (External file include)
; Compile with: nasm -f elf helloworld-inc.asm
; Link with (64 bit systems require elf_i386 option): ld -m elf_i386 helloworld-inc.o -o helloworld-inc
; Run with: ./helloworld-inc
 
%include        'functions.asm'                             ; include our external file
 
SECTION .data
msg1    db      'Hello, brave new world!', 0h              ; Note the null terminating byte
msg2    db      'This is how we recycle in NASM.', 0h      ; Note the null terminating byte
 
SECTION .text
global  _start
 
_start:
 
    mov     eax, msg1
    call    sprintLF        ; NOTE we are calling our new print with linefeed function
 
    mov     eax, msg2
    call    sprintLF        ; NOTE we are calling our new print with linefeed function
 
    call    quit            ; call our quit function
