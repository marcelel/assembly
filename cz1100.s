.text
.type check_div ,@function
.global check_div

check_div: 
    mov $0, %rax
    cmp $0, %edx #check c 
    je cEqualsZero
    jmp binary

cEqualsZero:
    mov %rdi, %rax #numerator
    mov %rsi, %r8 #dominator
    mov $0, %rdx #rest division
    idiv %r8
    cmp $0, %rdx
    jne retZero
    mov $1, %rax
    ret

retZero:
    mov $0, %rax
    ret

binary:
    mov $64, %r8 #counter
    mov $0, %rax #numerator
    mov $0, %r9 #dominator
    mov $0, %rdx #rest division
    mov $0, %r10 #mask to return

binaryLoop:
    cmp $0, %r8
    je end
    mov %rdi, %rax
    mov $0, %rdx
    idiv %r8
    dec %r8
    cmp $0, %rdx
    je add1
    shl %r10
    jmp binaryLoop

add1:
    shl %r10
    OR $1, %r10
    jmp binaryLoop

end:   
    mov %r10, %rax
    ret

