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

	mov $control_word, %esi

	fstcw (%esi)
	fwait

	mov (%esi), %ax

	ret

setControl:

	push %ebp
	mov %esp, %ebp

	movl 8(%ebp), %ebx

	mov %bx, control_word

	mov $control_word, %esi

	fclex

	fldcw (%esi)

	mov %ebp, %esp
	pop %ebp

	ret

getStatus:

	fstsw %ax

	ret
