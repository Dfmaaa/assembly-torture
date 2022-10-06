READ equ 3
WRITE equ 4
STDIN equ 0
STDOUT equ 1
EXIT equ 1
NAMES_LEN 10
segment.bss
	lastname resb NAMES_LEN
	firstname resb NAMES_LEN
segment.data
	fnameask db 'What is your first name?',0XA,0XD ; newline and carriage return
	fml equ $-fnameask
	lnameask db 'What is your last name?',0XA,0XD
	lml equ $-lnameask
	cnameask db 'Change first name(should be of equal length)',0XA,0XD
	cml equ $-cnameask
	namep db 'Your name is: '
	nml equ $-namep
	nlcr equ 0XA, 0XD
	el equ $-nlcr
segment.text
	global _start
	_start:
		mov ecx, fnameask
		mov edx, fml
		mov eax, WRITE
		mov ebx, STDOUT
		int 0x80 //wrote first name message to stdout
		mov ecx, firstname
		mov edx, NAMES_LEN
		mov ebx, STDIN
		mov eax, READ
		int 0x80 ; received first name
		mov ecx, lnameask
		mov edx, lml
		mov eax, WRITE
		mov ebx, STDOUT
		int 0x80 ; wrote last name message to stdout
		mov ecx, lastname
		mov edx, NAMES_LEN
		mov ebx, STDIN
		mov eax, READ
		int 0x80 ; received last name
		mov ecx, namep
		mov edx, nml
		mov ebx, STDOUT
		mov eax, WRITE
		int 0x80 ; about to write full name
		mov ecx, firstname
		mov edx, NAMES_LEN
		mov eax, WRITE
		mov ebx, STDOUT
		int 0x80 ; wrote first name to stdout
		mov ecx,db ' '
		mov edx, 1
		mov eax, WRITE
		mov ebx, STDOUT
		int 0x80 ; wrote space character to stdout
		mov ecx, lastname
		mov edx, NAMES_LEN
		mov eax, WRITE
		mov ebx, STDOUT
		int 0x80 ; wrote last name to stdout
		mov ecx, nlcr
		mov edx, el
		mov ebx, STDOUT
		mov eax, WRITE
		int 0x80 ; wrote newline and carriage return to stdout
		mov ecx, cnameask
		mov edx, cml
		mov ebx, STDOUT
		mov eax, WRITE
		int 0x80
		mov ecx, firstname
		mov edx, NAMES_LEN
		mov ebx, STDIN
		mov eax, READ
		int 0x80 ; received first name
		mov ecx, namep
		mov edx, nml
		mov ebx, STDOUT
		mov eax, WRITE
		int 0x80 ; about to write full name
		mov ecx, firstname
		mov edx, NAMES_LEN
		mov eax, WRITE
		mov ebx, STDOUT
		int 0x80 ; wrote first name to stdout
		mov ecx,db ' '
		mov edx, 1
		mov eax, WRITE
		mov ebx, STDOUT
		int 0x80 ; wrote space character to stdout
		mov ecx, lastname
		mov edx, NAMES_LEN
		mov eax, WRITE
		mov ebx, STDOUT
		int 0x80 ; wrote last name to stdout
		mov ecx, nlcr
		mov edx, el
		mov ebx, STDOUT
		mov eax, WRITE
		int 0x80 ; wrote newline and carriage return to stdout
		mov eax, EXIT
		int 0x80	