.text
.type check_tab ,@function
.global check_tab

check_tab:
    mov $0, %r8

zeroTab:
    movb $0, array(, %r8, 1)
    cmp $63, %r8
    je zeroParams
    inc %r8
    jmp zeroTab

zeroParams:
    movl $0, (%rdx)
    mov $0, %rax
    mov $0, %r8 #counter
    mov $0, %r9 #value in array
    mov $0, %r10 #value in array passed by argument

initTab:
    mov $0, %r9
    mov $0, %r10
    cmp %rsi, %r8
    je initMax
    mov (%rdi, %r8, 4), %r10d
    inc %r8
    cmp $63, %r10d
    jg initTab
    cmp $0, %r10d
    jl initTab 
    movb array(, %r10, 1), %r9b
    inc %r9
    movb %r9b, array(, %r10, 1)
    jmp initTab

initMax:
    mov $0, %r8 #counter
    mov $0, %r9
    mov $1, %r10 #shift
    
findMax: 
    cmp $64, %r8
    je end
    movb array(, %r8, 1), %r9b
    inc %r8
    cmp $0, %r9b
    je findMax

binary:
    dec %r8
    mov $1, %r10
    movb $0, %cl
    movb %r8b, %cl
    shl %cl, %r10
    OR %r10, %rax
    inc %r8

    cmp %r9d, (%rdx)
    jg findMax
    movl %r9d, (%rdx)
    jmp findMax
    
end:
    ret

.data
array:
.byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 
