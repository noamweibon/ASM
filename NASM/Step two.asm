; We declare three variables: var1, var2, and result  
; We assign a value to them using db 
; This first part of the code is the initialization and definition of variables

section .data  
    var1 db 2          ; Declare var1 and assign it the value 2         
    var2 db 10         ; Declare var2 and assign it the value 10         
    result db 0        ; Declare result and initialize it to 0        

; Indicates the beginning of the executable code  
; The execution of the program starts at _start

section .text  
    global _start

; mov allows loading a value into a register  
; add allows adding a value to a register 
; mov [result], al transfers the value contained in the AL register to the variable result

_start:
    mov al, [var1]      ; Load the value of var1 into AL  
    add al, [var2]      ; Add the value of var2 to AL  
    mov [result], al    ; Store the result from AL into the variable result

; Here we assign the value 1 to the eax register  
; The eax register is used for arithmetic operations 
; By assigning 1 to it, we indicate that we are stopping the program  
; We use the XOR operator to manipulate the ebx register  
; This operation allows us to assign 0 to ebx 
; ebx returning 0 indicates a successful program execution  
; The int instruction is a stop instruction that triggers a software interrupt  
; 0x80 is an interrupt number  
; 0x80 designates a system call

    mov eax, 1          ; syscall number for exit  
    xor ebx, ebx        ; return code 0  
    int 0x80            ; invoke the syscall
