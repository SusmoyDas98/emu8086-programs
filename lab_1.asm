.MODEL SMALL 
; our project in a small one, 
; the options include: 
; 1) Small, 2) Medium, 3) Compact, 4) Large, 5) Huge
 
.STACK 100H  ; related to stack segment

.DATA ; related to data segment 

; declare variables here
; variables are stored in the memory's data segment       

X DB 10
NUM DW 12
CHR DB "a"
STR DB "Hello$"                
; defining empty variable
SUM DB ?                      



;--------------
; TASK 6
;--------------
A DB 10
B DB 5


.CODE
MAIN PROC

; initialize DS
         
MOV AX, @DATA                   
MOV DS, AX
 
; enter your code here   

                      
;--------------
; BASIC OPERATIONS 
;--------------

              
MOV AX, 10 ; AX = 1010/A                
MOV BX, AX ; CAN MOVE 
;MOV CL, AX ; CL -> control reg (low) 8 bit , but AX -> 16 bit, hence not possible
MOV AL, X ; AL->8 bit  
MOV SUM, AL
MOV AL, NUM ; WOULD NOT WORK, BECAUSE NUM->32 BIT , AL ->  8 BIT
           
           
;--------------
; ADDITION 
;--------------

  
MOV AX, 10
ADD AX, 2

MOV BX, 10
MOV DX, 2
ADD BX, DX
           
           
;--------------
; SUBTRACTION 
;--------------


MOV AX, 10
SUB AX, 2

MOV BX, 10
MOV DX, 2
SUB BX, DX
           
           
;--------------
; DECREMENT 
;--------------


MOV AX, 10
DEC AX

           
           
;--------------
; INCREMENT 
;--------------


MOV AX, 10
INC AX


;--------------
; NEGATION 
;--------------


MOV AX, 10
NEG AX      


;--------------
; TASK 6 
;--------------


MOV AL, A           
MOV BL, B      
SUB AL, BL      


;--------------
; BYTE MULTIPLICATION: 
; -> ONE OF THE OPERANDS MUST BE STORED IN AL
; -> OTHER OPERAND CAN BE STORED IN ANY 8 BIT REGISTER
; -> THE OUTPUT IS ALWAYS STORED IN AX
;--------------


MOV AL, 012H
MOV BL, 013H
MUL BL


;--------------
; WORD MULTIPLICATION: TASK 7 (i) 
; -> ONE OF THE OPERANDS MUST BE STORED IN AX
; -> OTHER OPERAND CAN BE STORED IN ANY OTHER 16 BIT REGISTER 
; -> HIGER 8 BITS ARE STORED IN DX REGISTER 
; -> LOWER 8 BITS ARE STORED IN AX REGISTER
;--------------


MOV AX, 036DFH
MOV BX, 0AFH
MUL BX          


;--------------
; BYTE DIVISION
; -> 16 BIT DIVIDENT MUST BE IN AX
; -> THE 8 BIT DIVISOR CAN BE IN ANY 8 BIT REGISTER
; -> THE 8 BIT REMAINDER WILL BE IN AH 
; -> THE 8 BIT QUOTIENT WILL BE IN AL
; -> WHEN DIVIDING 16 BITS, THE ANSWER/QUOTIENT/REMAINDER WILL BE IN 8 BIT
; -> EXCEPTION : WHEN DIVIDING WITH 1, THE BIT NUMBER REMAINS UNCHANGED
; -> CURRENTLY CANNOT HANDLE SUCH EXCEPTIONS WITH THIS CODE
;--------------


MOV AX, 13
MOV BL, 4
DIV BL
 

;--------------
; WORD DIVISION
; -> USED WHEN THE DIVIDENT > 16 (32 MAX) BITS OR DIVISOR IS 16 BITS
; -> 32 BIT DIVIDENT MUST BE STORED IN DX:AX 
; -> 16 BIT DIVISOR CAN BE IN ANY OTHER 16 BIT REGISTER
; -> 16 BIT REMAINDER IN DX AND 16 BIT QUOTIENT IN AX
;--------------


MOV DX, 0
MOV AX, 0F4D5H
MOV BX, 0C9AFH
DIV BX



           


           
 
           
 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
