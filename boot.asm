;boot.asm:
[bits 32] ;
global start ;
extern _kernel_main ;
;
section .mbHeader

align 0x4
 
; setting up the Multiboot header - see GRUB docs for details
MODULEALIGN equ  1<<0                   ; align loaded modules on page boundaries
MEMINFO     equ  1<<1                   ; provide memory map
FLAGS       equ  MODULEALIGN | MEMINFO  ; this is the Multiboot 'flag' field
MAGIC       equ    0x1BADB002           ; lets bootloader find the header
CHECKSUM    equ -(MAGIC + FLAGS)        ; checksum required
 
MultiBootHeader:
   dd MAGIC
   dd FLAGS
   dd CHECKSUM
 
;
start:
push ebx ;this is optional and load's the grub structure
call _kernel_main