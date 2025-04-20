; Before writing any code it's better to introduce some notions
; rax for register a extended is used to store the result of arithmetic and logical operations
; rdi for register destination index is used to pass the first argument to functions
; rsi for register source index is used to pass the second argument to functions and for certain system calls.


;First we need the data section
;Here to initiate variable or write a prompt with the value

section.data  
  prompt db 'Type a value', 0  
  prompt_len equ $ - prompt  
  


;The bss section is used to reserve uninitialized memory
section.bss  
  input resb 128  ; Reserve 128 bytes to store user input

section.text  
global_start

;Then start contains the executable code of the program

_start:
    ; First, we need to display the message  
    mov rax, 1                                ; syscall to write  
    mov rdi, 1                                ; file descriptor 1 (stdout)
    mov rsi, prompt                           ; address of the message to display  
    mov rdx, prompt_len                       ; length of the message  
    syscall                                    ; system call to write

    ; Read the user input  
    mov rax, 0                                ; syscall to read  
    mov rdi, 0                                ; file descriptor 0 (stdin)
    mov rsi, input                            ; address where to store the input  
    mov rdx, 128                              ; number of bytes to read  
    syscall                                    ; system call to read

    ; rax now contains the number of bytes read  
    ; Display the input 
    mov rax, 1                                ; syscall to write  
    mov rdi, 1                                ; file descriptor 1 (stdout)
    mov rsi, input                            ; address of the input to display  
    mov rdx, rax                              ; put the length into rdx  
    syscall                                    ; system call to write

    ; End of the program  
    mov rax, 60                               ; syscall to terminate the program  
    xor rdi, rdi                              ; return code 0  
