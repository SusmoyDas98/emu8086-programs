;=================
; Flow control instructions and Branching Structures
;=================

.MODEL SMALL
.STACK 100H
.DATA
; declare variables here                

string1 db "give the value of a :$"
string2 db "give the value of b :$"
string3 db "a is greater$"
string4 db "b is greater$" 
string5 db "both are equal$"                       

a db ?
b db ?

.CODE
MAIN PROC
; initialize DS
MOV AX,@DATA
MOV DS,AX
; enter your code here              

;=================
; CONDITIONAL JUMP INSTRUCTIONS
; -> JE: ( DESTINATION == SOURCE )
; -> JG: ( DESTIANTION >  SOURCE )
; -> JL: ( DESTINATION < SOURCE )
; -> JGE: ( DESTINATION >= SOURCE )
; -> JLE: ( DESTINATION <= SOURCE )
;=================            

;=================
; UNCONDITIONAL JUMP INSTRUCTION
; -> JMP 
;=================


MOV AL, 9
MOV BL, 6

CMP AL, BL ; COMPARE  BETWEEN AL AND BL
JG IF ; IF AL> BL JUMP TO THE INSTRUCTION LABELLED IF     
SUB  AL, 2 
JMP EXIT

IF:
ADD AL, 2
          
          
               
                
                
;=================
; EXAMPLE: DO THE FOLLOWING SNIPPET USING ASSEMBLY CODE

;a = input("give the value of a:")
;b = input("give the value of b:")
;if (a>b):
;    print("a is greater")
;elif (b>a):
;    print("b is greater")
;else:
;    print("both are equal")
;=================               

; a = input("give the value of a:")
LEA DX, string1
MOV AH, 9
INT 21H

MOV AH,  1
INT 21H
MOV BL, AL ; SINCE AL WOULD BE OVERWRITTEN WHEN TAKING THE NEXT INPUT

MOV a, BL
SUB a, 48

; MOVING TO  THE NEXT LINE
MOV AH, 2
MOV DL, 10                     
INT 21H                              

MOV AH, 2
MOV DL, 13
INT 21H

;b = input("give the value of b:")
LEA DX, string2
MOV AH, 9
INT 21H

MOV AH,  1
INT 21H
MOV BL, AL ; SINCE AL WOULD BE OVERWRITTEN WHEN TAKING THE NEXT INPUT
SUB BL, 48

; MOVING TO  THE NEXT LINE
MOV AH, 2
MOV DL, 10                     
INT 21H                              

MOV AH, 2
MOV DL, 13
INT 21H

;if (a>b):
CMP a, BL
JG IF               
JL ELSE_IF
;else:
;    print("both are equal")
LEA DX, string5
MOV AH, 9
INT 21H
JMP EXIT ; UNCONDITIONAL JUMP                     

IF: 
;print("a is greater")
LEA DX, string3
MOV AH, 9
INT 21H    
JMP EXIT ; UNCONDITIONAL JUMP  

ELSE_IF:
;print("b is greater")
LEA DX, string4
MOV AH, 9
INT 21H         





;exit to DOS
EXIT:
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN
