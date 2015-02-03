bits 32

; code section
section .text

; multiboot header
align 4
dd 0x1BADB002             ; magic
dd 0x00                   ; flags
dd - (0x1BADB002 + 0x00)  ; checksum

global start
extern kmain

; call into the kernel
start:
  cli
  call kmain
  hlt
