;=================
; Basic I/O:      
; -> 1) SINGLE CHARACTER INPUT
; -> 2) SINGLE CHARACTER OUTPUT 
; -> 3) STRING OUTPUT 
;=================


;=================                                                                
; INTERRUPT :
; IN ORDER TO CARRY OUT BASIC I/O OPERATIONS THE PROGRAM IS HALTED TEMPORARILY
; 256 TYPES OF INTERRUPT EXISTS
;=================

.MODEL SMALL
.STACK 100H
.DATA
; declare variables here --> ANY DATA IN VARIABLE IS STORED HERE

; DECLARING A STRING  VARABLE
A DB "hello world$"        
ask    DB "Enter a digit: $"
result DB "My favourite digit is: $"


.CODE
MAIN PROC
; initialize DS
MOV AX,@DATA
MOV DS,AX
; enter your code here       

                                      
                                      
;=================    
; SINGLE CAHRACTER INPUT
; -> INPUT'S ASCII VALUE IS STORED IN  AL
; -> MOV  AH, 1 TAKING A SINGLE CHARACTER INPUT FROM THE USER
; -> MOV  AH, 2 SENDING A SINGLE CHARACTER OUTPUT TO THE USER   
;=================                  

MOV AH, 1
INT  21H



;=================    
; SINGLE CAHRACTER OUTPUT     
; -> OUTPUT HAS TO BE STORED IN DL     
; -> CONVERTS THE ASCII TO ITS EQUIVALENT CHARACTER FOR OUTPUT                              
; -> MOV  AH, 9 SENDING A STRING CHARACTER OUTPUT TO THE USER   
;=================
                                                
MOV AH, 2     
MOV DL, 15H
INT 21H 



;=================    
; STRING OUTPUT     
; -> OUTPUT HAS TO BE STORED IN DL     
; -> CONVERTS THE ASCII TO ITS EQUIVALENT CHARACTER FOR OUTPUT                              
; -> LEA -> LOADS EFFECTIVE ADDRESS OF A VARIABLE IN A REGISTER (CAN BE ANY)
; -> MOV  AH, 9 SENDING A STRING CHARACTER OUTPUT TO THE USER   
;=================  
          
LEA DX, A ; --> LOADING EFFECTIVE ADDRESS OF A IN DX
MOV AH, 9       
INT 21H            



;=================                                              
; CARRIAGE RETURN AND MOVING TO A NEW LINE
; -> SENDS CURSOR TO THE LEFT MOST BIT
;=================             

    ; Showing first message
    LEA DX, ask
    MOV AH, 9
    INT 21H

    ; Taking Input
    MOV AH, 1
    INT 21H
    MOV BL, AL

    ; Moving to a New Line
    MOV AH, 2
    MOV DL, 10
    INT 21H

    MOV AH, 2
    MOV DL, 13
    INT 21H

    ; Showing Result
    LEA DX, result
    MOV AH, 9
    INT 21H

    MOV AH, 2
    MOV DL, BL
    INT 21H



;exit to DOS
MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN
