.text
.type encode ,@function
.global encode


encode:
    cmp $0, %rdx #checking third argument's value
    je op0
    cmp $1, %rdx
    je op1
    
op0:
    mov %rdi,%rax 
    RET

op1:
    mov $0, %r10 #stack counter 
    mov $0, %r8 #counter 
    mov %rdi, %rax #copy memory address to the return value

loopOp1:
    cmp $9, %r8 #check if the counter exceeds 0-9 values
    jg remove #if so go to the remove part

    mov $1, %r9 
    AND %rsi, %r9 #check whether the youngest bit is equal to one
    cmp $1, %r9
    jne incLoopOp1 #if it's not go to the incrementation part of Loop
    add $48, %r8 #if it is equal - change a number to a char representing it and add it on the stack
    inc %r10 #increment stack's counter and shift the mask to the right
    inc %r8
    shr %rsi
    push %r8
    sub $48, %r8
    jmp loopOp1

incLoopOp1:
    shr %rsi #increment counter and shift the mask to the right
    inc %r8
    jmp loopOp1

remove:
    mov $0, %r9 #to make sure that this register doesn't keep any weird value
    mov $0,%rsi #the return string's counter 
    mov $0, %r8 #tmp value to store char's from stack
    cmp $0, %r10 #if stack's number is equal to zero - end function
    je exitOp1
    pop %r8 #getting character from a stack that will be removed from entire string

    sub $1,%r10 #decrementating stack's number

stringLoop:
    cmp $0, (%rax, %r9, 1) #if end of string go to the next stack's character
    je beforeRemove
    mov $0, %rcx
    mov (%rax, %r9, 1), %cl
    cmp %r8, %rcx #string's character is equal to the removing character
    je increment

    mov $0,%r11 #string's character is not equal to the removing character - copy character to the return string
    mov (%rax, %r9, 1), %r11
    mov %r11b,(%rdi,%rsi,1)
    inc %r9 #increment both strings' counter
    inc %rsi
    jmp stringLoop

increment: #skip deleting char
    inc %r9 
    jmp stringLoop

beforeRemove:
    #inc %rsi #increment return string character and insert end of string character

    movb $0,(%rdi,%rsi,1)
    mov %rdi, %rax
    jmp remove


exitOp1:
    mov %rdi,%rax 
    RET
