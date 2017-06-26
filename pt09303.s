.text
.type encode ,@function
.global encode

encode:
    cmp $0, %rdx #checking operation
    je exit0
    cmp $3, %rdx #checking operation
    jg exit0
    mov $0,%r8 #index counter

zero:
    cmp $10, %r8
    je initializeArrayPre
    movb $0, array(,%r8,1)
    inc %r8

initializeArrayPre:
    mov $0,%r8 #index counter

initializeArray:
    cmp $9, %r8
    jg second

    mov %rsi, %r9
    AND $1, %r9
    cmp $1, %r9 
    je addElement

    shr %rsi
    inc %r8
    jmp initializeArray

addElement:
    movb $1, array(,%r8,1)
    inc %r8
    shr %rsi
    jmp initializeArray

second:
    mov $0, %r8 #first String counter
    mov $0, %r9 #second String counter
    mov $0, %r10 #array value
    mov $0,%r11 #tmp char holder

    jmp second1

second1:
    mov $0, %r10
    mov $0, %r11
    movb (%rdi, %r8, 1), %r11b
    cmp $0, %r11b
    je end
    cmp $48, %r11b
    jl iter
    cmp $57, %r11b
    jg iter

    sub $'0', %r11
    movb array(,%r11,1), %r10b
    add $'0', %r11
    cmp $0,%r10b
    je iter

    cmp $1, %rdx
    je del
    cmp $2 ,%rdx
    je tra
    cmp $3, %rdx
    je sw

    jmp second1

end:
    movb %r11b,(%rax,%r9,1)
    ret

iter:
    movb %r11b,(%rax,%r9,1)

    inc %r8
    inc %r9
    jmp second1

del:
    inc %r8
    jmp second1

tra:
    mov $57, %rcx
    sub %r11b, %cl
    add $48, %cl
    movb %cl,(%rax,%r9,1)
   
    inc %r8
    inc %r9
    jmp second1

sw:
    movb %cl,(%rax,%r9,1)
    inc %r8
    inc %r9
    jmp second1

exit0:
    mov %rdi ,%rax
    ret 

.data
tmpCharValue:
.byte 0

array:
.byte 0,0,0,0,0,0,0,0,0,0
