.data
format_char: .string "%i %i %i %i \n"
zero8: .quad 0
.bss
#.comm buf, 1;
.comm width, 4;
.comm height, 4;
.comm resolution, 4
.comm breakCount, 4

.text
.global fastFilter
.type fastFilter, @function

fastFilter:
push %ebp
mov %esp, %ebp
push %ebx


movl 12(%ebp), %edx
movl %edx, width
movl 16(%ebp), %eax
movl %eax, height

mull %edx
movl %eax, resolution
movl $0, %edx
movl $8, %ebx
divl %ebx
subl $50, %eax
movl %eax, breakCount

movl 8(%ebp), %eax

#movb (%eax, %ecx, 1), %bl
#addb $3, %bl
#movb %bl, (%eax, %ecx, 1)
xorl %ebx, %ebx
movl $0, %ecx
emms

petla:
movq (%eax, %ecx, 8), %mm0
movq %mm0, %mm1
movq zero8, %mm2
movq 50(%eax, %ecx, 8), %mm4
movq %mm4, %mm5

PUNPCKLBW %mm2, %mm1 #rozdzielenie 8 bajtow na 4 * 2 bajty
PUNPCKHBW %mm2, %mm0

PUNPCKLBW %mm2, %mm5
PUNPCKHBW %mm2, %mm4

movq %mm0, %mm2 #przygotowanie do mnozenia przez 3
movq %mm1, %mm3

paddusw %mm0, %mm2 #mnozenie przez 3 za pomoca dodawania
paddusw %mm0, %mm2
paddusw %mm1, %mm3
paddusw %mm1, %mm3

paddusw %mm5, %mm3
paddusw %mm4, %mm2

psrlw $2, %mm3 #dzielenie przez 4
#psrlw %mm3
psrlw $2, %mm2
#psrlw %mm2

PACKUSWB %mm2, %mm3

movq %mm3, (%eax, %ecx, 8)

inc %ecx
cmpl %ecx, breakCount
jg petla


emms
pop %ebx
mov %ebp, %esp
pop %ebp

ret
