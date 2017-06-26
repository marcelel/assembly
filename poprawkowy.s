.text
.type max_1_ind ,@function
.global max_1_ind

max_1_ind:

initParams:
    movl $0, (%rdx)
    movl $0, (%rcx)
    mov $0, %rax #
    mov $0, %r8 #counter
    mov $0, %r9 #tmp value
    mov $0, %r10 #even counter
    mov $2, %r11 #denominator
    push %rdx

even:
    mov $0, %rax
    cmp %rsi, %r8
    je clearrdx
    mov (%rdi, %r8, 8), %rax
    mov $0, %rdx
    idiv %r11
    inc %r8
    cmp $0, %rdx
    jne even
    inc %r10
    jmp even

clearrdx:
    pop %rdx
    movl %r10d, (%rdx)
    mov $0, %rax #
    mov $0, %r8 #counter
    mov $0, %r9 #tmp value
    mov $0, %r10 #negative counter
    mov $2, %r11 #denominator

negative:
    cmp %rsi, %r8
    je movercx
    mov (%rdi, %r8, 8), %r9
    inc %r8
    cmp $0, %r9
    jge negative
    inc %r10
    jmp negative

movercx:
    movl %r10d, (%rcx)

initReturn:
    mov $0, %rax 
    mov $0, %r8 #index
    mov $0, %r9 #max index
    mov $0, %r10 #actual value
    mov $0, %r11 #max
    push %r12
    mov $0, %r12 #tmp counter
    push %r13
    mov $0, %r13 #shift index
    push %r14
    mov $0, %r14 #binary counter
    push %r15
    mov $0, %r15

return:
    mov $0, %r12
    mov $0, %r10
    cmp %rsi, %r8
    je end
    mov (%rdi, %r8, 8), %r10
    mov $0, %r13
    
returnLoop:
    cmp $64, %r13
    je check
    inc %r13
    mov %r10, %r15
    shr %r10
    AND $1, %r15
    cmp $1, %r15
    jne returnLoop
    inc %r12
    jmp returnLoop

check:
    inc %r8
    cmp %r12, %r11
    jg return
    dec %r8
    mov %r12, %r11
    mov %r8, %r9
    inc %r8
    jmp return

end:
    pop %r15
    pop %r14
    pop %r13
    pop %r12
    mov %r9, %rax
    ret