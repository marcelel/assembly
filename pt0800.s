.text
.type fun ,@function
.global fun

fun:
    mov $0, %r8 #value to check
    mov $1, %r9 #counter
    mov $0, %r10 #first argument
    mov %rdi, %r10
    mov $0, %r11 #tmp sum/multiply

checkB:
    cmp $1, %rsi
    je sum
    cmp $2, %rsi
    je multiply
    jmp count
sum:
    cmp $65, %r9
    je count
    mov %r10, %r8
    shr %r10
    AND $1, %r8
    cmp $1, %r8
    je addValue
    inc %r9
    jmp sum

addValue:
    add %r9, %r11
    inc %r9
    jmp sum

multiply:
    mov $0, %r8 #value to check
    mov $1, %r9 #counter
    mov $0, %r10 #first argument
    mov %rdi, %r10
    mov $1, %r11 #tmp sum/multiply

multiplyLoop:
    cmp $65, %r9
    je count
    mov %r10, %r8
    shr %r10
    AND $1, %r8
    cmp $1, %r8
    je multiplyValue
    inc %r9
    jmp multiplyLoop

multiplyValue:
    imul %r9, %r11
    inc %r9
    jmp multiplyLoop  

ret0:
    mov $0, %rax
    ret

count:
    mov $0, %r8 #value to check
    mov $0, %r9 #counter
    mov $0, %r10 #first argument
    mov %rdi, %r10
    mov $0, %r12 #tmp sum/multiply

countLoop:
    cmp $64, %r9
    je pcs
    inc %r9
    mov %r10, %r8
    shr %r10
    AND $1, %r8
    cmp $1, %r8
    je doCount
    jmp countLoop

doCount:
    inc %r12
    jmp countLoop 

pcs:
    mov $0, %r8 #value to check
    mov $0, %r9 #counter
    mov $0, %r10 #first argument
    mov %rdi, %r10
    mov $0, %r12 #tmp sum/multiply

pcsLoop:
    cmp $64, %r9
    je end
    mov %r10, %r8
    shr %r10
    AND $1, %r8
    cmp $1, %r8
    je doPcs
    inc %r9
    jmp pcsLoop

doPcs: 
    mov %r9, %rsi
    inc %r9
    jmp pcsLoop

end:
    movl %esi, (%rdx)
    movl %r12d, (%rcx)
    mov %r11, %rax
    ret
