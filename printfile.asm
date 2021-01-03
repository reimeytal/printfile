%define CHUNKSIZE 512

global _start

section .data
file db "hello.txt"

section .text
_start:
  add esp, 8
  pop ebx
  add esp, 12
  mov eax, 5
  mov ecx, 0
  int 0x80

  push eax
  jmp read

read:
  pop ebx

  mov eax, 3
  mov ecx, esp
  mov edx, CHUNKSIZE
  int 0x80

  push ebx
  jmp print

print:
 mov edx, eax
 mov eax, 4
 mov ebx, 1
 add esp, 4
 mov ecx, esp
 sub esp, 4
 int 0x80

 cmp edx, CHUNKSIZE
 jl end
 jmp read

end:
  pop ebx
  mov eax, 6
  int 0x80

  mov eax, 1
  mov ebx, 0
  int 0x80
