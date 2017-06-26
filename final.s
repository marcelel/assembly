.text
.type check_tab ,@function
.global check_tab

check_tab: 
    mov $0, %r8

clearArray:
    cmp $64, %r8
    je clearParams
    movb $0, array(, %r8, 1)
    inc %r8
    jmp clearArray

clearParams:
    movl $0, (%rdx)
    mov $0, %r8 #counter
    mov $0, %r9 #value from array passed as argument
    mov $0, %r10 #value from array
    mov $0, %rax

initArray:
    mov $0, %r9
    mov $0, %r10
    cmp %rsi, %r8
    je clearParamsBeforeSearching
    mov (%rdi, %r8, 4), %r9d
    inc %r8
    cmp $63, %r9d
    jg initArray
    cmp $0, %r9d
    jl initArray
    movb array(, %r9, 1), %r10b
    inc %r10
    movb %r10b, array(, %r9, 1)
    jmp initArray

clearParamsBeforeSearching:
    movl $0, (%rdx)
    mov $0, %r8 #counter
    mov $0, %r9 #value from array 
    mov $0, %r10 #max value
    mov $1, %r11 #shift
    mov $0, %rax

searchMax:
    cmp $64, %r8
    je end
    movb array(, %r8, 1), %r9b
    inc %r8
    cmp $0, %r9
    je searchMax

binary:
    dec %r8
    mov $1, %r11
    movb $0, %cl 
    movb %r9b, %cl
    shl %cl, %r11
    OR %r11, %rax
    inc %r8

    cmp %r9d, (%rdx)
    jg searchMax
    movl %r9d, (%rdx)
    jmp searchMax

end:
    ret

.data
array:
.byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 
