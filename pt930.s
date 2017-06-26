.text
.type encode ,@function
.global encode

encode:

initParams:
    mov $0, %r8 #counter
    mov $1, %r9 #tmp mask
    mov $0, %r10 #stack counter

checkMask:
    mov $1, %r9 
    cmp $10, %r8
    je initParamsBeforeOperation
    AND %rsi, %r9
    cmp $1, %r9
    je pushStack
    shr %rsi
    inc %r8
    jmp checkMask

# 783 - 1100001111
# 271 - 100001111
# 391 - 110000111

pushStack:
    shr %rsi
    inc %r10
    add $48, %r8
    push %r8
    sub $48, %r8
    inc %r8
    jmp checkMask

initParamsBeforeOperation:
    mov $0, %r8 #counter
    mov $0, %r9 #tmp counter
    mov $0, %r11 #stack value
    mov %rdi, %rax
    mov $0, %rsi

checkOperation:
    cmp $1, %rdx
    je remove
    cmp $2, %rdx
    je transpose
    cmp $3, %rdx
    je replace
    jmp clearStack

remove:
    cmp $0, %r10 
    je end
    pop %r11
    dec %r10
    mov %rax, %rdi
    mov $0, %r8
    mov $0, %r9

removeLoop:
    cmp $0, (%rdi, %r8, 1)
    je putEndStr
    cmp (%rdi, %r8, 1), %r11b
    je removeFun
    movb (%rdi, %r8, 1), %sil
    movb %sil, (%rax, %r9, 1)
    inc %r8
    inc %r9
    jmp removeLoop

putEndStr:
    movb $0, (%rax, %r9, 1)
    jmp remove

removeFun:
    movb (%rdi, %r8, 1), %sil
    movb %sil, (%rax, %r9, 1)
    inc %r8
    jmp removeLoop

replace:
    cmp $0, %r10 
    je end
    pop %r11
    dec %r10
    mov %rax, %rdi
    mov $0, %r8
    mov $0, %r9

replaceLoop:
    cmp $0, (%rdi, %r8, 1)
    je replace
    cmp (%rdi, %r8, 1), %r11b
    je replaceFun
    movb (%rdi, %r8, 1), %sil
    movb %sil, (%rax, %r8, 1)
    inc %r8
    jmp replaceLoop

replaceFun:
    movb %cl, (%rax, %r8, 1)
    inc %r8
    jmp replaceLoop

transpose:
    cmp $0, %r10 
    je end
    pop %r11
    dec %r10
    mov $0, %r8
    mov $0, %r9
    mov $0, %rdx

transposeLoop:
    mov $0, %rdx
    cmp $0, (%rdi, %r8, 1)
    je transpose
    cmp (%rdi, %r8, 1), %r11b
    je transposeFun     
    inc %r8
    jmp transposeLoop

transposeFun:
    mov $57, %rdx
    sub %r11b, %dl
    add $48, %dl
    movb %dl, (%rax, %r8, 1)
    inc %r8
    jmp transposeLoop

clearStack:
    cmp $0, %r10 
    je end
    pop %r11
    dec %r10
    jmp clearStack

end:
    ret