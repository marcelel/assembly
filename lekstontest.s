#Marcel Lekston

	.text
	.type check_tab, @function
	.global check_tab
	
check_tab:
	mov %rdi, %rax
    mov $0, %rdx
	mov $0, %r9 #aktualna wartosc najwieksza
	mov $0, %r11 #tymczasowa wartosc najwieksza
	mov $0, %r8 #licznik petli 
	mov $0, %r10 #aktualnie sprawdzana liczba
	mov $0, %rcx
	jmp loop	
	
main_loop:
	inc %rcx
	mov $0, %r8 #zerowanie licznika
	#inc %r10 #inkrementacja wartosci
	mov (%rax, %r8, 8), %r10
	cmp %rsi, %r10
	jge the_end
	jmp loop	
	
loop:
	cmp %rsi, %r8 #czy iterowac dalej
	jge check
	cmp (%rax, %r8, 8), %r10
	je equal
	inc %r8
	jmp loop
	
equal:
	inc %r11	
	inc %r8
	jmp loop
	
check:
	cmp %r11, %r9
	jg main_loop
	mov %r11, %r9
	jmp main_loop

the_end:
	mov $0, %rcx
   	mov %r9, %rdx
	ret
	