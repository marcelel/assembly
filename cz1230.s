.text
.type check_tab ,@function
.global check_tab

check_tab:

zero_tab:
    mov $63, %r8
zeroingloop:
    movb $0 ,array(, %r8, 1)
    cmp $0, %r8
    je rest 
    sub $1, %r8
    jmp zeroingloop
rest:
    mov $0, %r8 #array counter
    mov $0, %r9 #value to get element of an array
    mov $0, %r10 #value to store tmp max element of an array
    mov $0, %rax
    mov $0, %r11 #value from getting array elements

loopOverArray:
    mov $0,%r9
    cmp %r8, %rsi
    je prepareToLookingForMaximum
    movl (%rdi,%r8,4), %r9d
    inc %r8
    cmp $0,%r9 #check if argument's element is in appropriate 0-63 range
    jl loopOverArray
    cmp $63, %r9
    jg loopOverArray
    movb array(, %r9, 1), %r11b #get element from an array - argument's element as an index
    inc %r11
    movb %r11b ,array(, %r9, 1) 
    mov $0,%r11
    jmp loopOverArray

prepareToLookingForMaximum:
    mov $63, %r8 #array counter
    mov $0, %r9 #value to get element of an array
    mov $0, %r10 #value for maximum
    mov $1, %r11 #tmp for binary shifts
    #mov $0, %rcx

lookingForMaximum:
    cmp $-1, %r8 #to have range 0-63
    je end
    mov array(,%r8,1), %r9b #get value from array
    sub $1,%r8
    cmp $0, %r9b #if zero go to another value, if not make binary 
    je lookingForMaximum

binary:
    add $1, %r8
    movb $0, %cl
    mov $1, %r11
    movb %r8b, %cl
    shl %cl, %r11
    OR %r11, %rax
    mov $1, %r11
    sub $1,%r8


    cmp %r10, %r9
    jl lookingForMaximum
    mov %r9, %r10
    jmp lookingForMaximum
    
end:
    movl %r10d,(%rdx)
    ret

.data
array:
.byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 
