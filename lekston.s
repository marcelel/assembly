#Marcel Lekston

	.text
	.type check_tab, @function
	.global check_tab
	
check_tab:
	mov %rdi, %rax
	movl $0, (%rdx)
	mov $0, %r9 #licznik glownej petli
	mov $0, %r11 #tymczasowa wartosc najwieksza
	mov $0, %r8 #licznik petli 
	mov $0, %r10 #aktualnie sprawdzana liczba
	jmp main_loop

main_loop:
	mov $0, %r11 #zerowanie tymczasowa
	mov $0, %r8 #zerowanie licznika
	mov (%rax, %r9, 4), %r10d
	inc %r9
	cmp $63, %r10
	jge main_loop
	cmp $0, %r10
	jl main_loop
	cmp %esi, %r9d
	jg the_end
	jmp loop	
	
loop:
	cmp %esi, %r8d #czy iterowac dalej
	jg check
	cmp (%rax, %r8, 4), %r10d
	je equal
	inc %r8
	jmp loop
	
equal:
	inc %r11
	inc %r8
	jmp loop
	
check:
	cmp %r11d, (%rdx) 
	jg main_loop
	mov %r11d, (%rdx)
	jmp main_loop

the_end:
	ret
	