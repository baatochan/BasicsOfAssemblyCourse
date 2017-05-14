.data
control_word: .short 0
control_word2: .long 0
status: .short 0

.text
.global getControl, setControl, getStatus
.type getControl, @function
.type setControl, @function
.type getStatus, @function
getControl:
	push %ebp
	mov %esp, %ebp
	push %esi

	mov $control_word, %esi

	fstcw (%esi)
	fwait

	mov (%esi), %ax

	pop %esi
	mov %ebp, %esp
	pop %ebp

	ret

setControl:

	push %ebp
	mov %esp, %ebp
	push %ebx
	push %esi

	movl 8(%ebp), %ebx

	mov %bx, control_word

	mov $control_word, %esi

	fclex

	fldcw (%esi)

	pop %esi
	pop %ebx
	mov %ebp, %esp
	pop %ebp

	ret

getStatus:
	push %ebp
	mov %esp, %ebp

	fstsw %ax

	mov %ebp, %esp
	pop %ebp

	ret
