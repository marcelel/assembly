#Marcel Lekston

	.text
	.type check_tab, @function
	.global check_tab
	
check_tab:
    movl $2, (%rdx)
    #mov (%rdi), %rdx
    mov $0, %rax  
    ret