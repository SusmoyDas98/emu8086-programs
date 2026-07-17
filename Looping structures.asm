;=================================

; Looping structures

;=================================



.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
                                       
;===============================================
; TWO TYPES OF LOOPS IN 8086 ASSEMBLY:
;
; (1) EXPLICIT LOOP:
;     - The programmer manually controls the entire loop.
;     - A loop counter is initialized by the programmer.
;     - The counter is incremented or decremented using
;       instructions such as INC, DEC, ADD, or SUB.
;     - The loop condition is checked using the CMP
;       instruction (or other comparison/test instructions).
;     - Conditional or unconditional jump instructions
;       (JMP, JNZ, JZ, JL, JG, etc.) are used to decide
;       whether to repeat the loop or terminate it.
;
; (2) IMPLICIT LOOP:
;     - The LOOP instruction automatically controls the loop.
;     - The programmer does not need to manually check
;       whether the counter has reached its limit.
;     - The CX register is always used as the loop counter.
;     - The LOOP instruction automatically decrements CX
;       and checks whether CX = 0.
;     - If CX ? 0, control jumps to the specified label;
;       otherwise, the loop terminates.
;===============================================

                               
                               
;===============================================                    

; EXPLICIT LOOP:
;
; -> Initialize the loop counter.
; -> Update the counter (INC or DEC) each iteration.
; -> Compare or test the counter (CMP, TEST, etc.).
; -> Use a conditional jump instruction to repeat
;    execution until the loop termination condition
;    is satisfied.                              

;===============================================

;-----------------LOOP IN JAVA------------------
; int x = 0;
;
; while (x < 5)
; {
;     System.out.println(x);
;     x++;
; }
;-----------------------------------------------

;-------SAME LOOP USING EXPLICIT LOOP IN ASSEMBLY-------       

MOV AH, 2 ; FOR SHOWING THE OUTPUT 
MOV DL, 30H ; int x = 0

START:                             
CMP DL, 35H ; while (x<5)
JGE  END
INT 21H   ; System.out.println(x)
INC DL    ; x++
JMP START                            

;-------------------------------------------------------



;===============================================

; IMPLICIT LOOP:
;
; -> Initialize the loop counter in CX.
; -> Write the instructions to be repeated.
; -> Use the LOOP instruction to automatically:
;      - Decrement CX by 1.
;      - Check whether CX = 0.
;      - Jump back to the specified label if CX ? 0.
; -> The loop terminates automatically when CX = 0.

;===============================================                     

;-----------------LOOP IN JAVA------------------
; int x = 0;
;
; while (x < 5)
; {
;     System.out.println(x);
;     x++;
; }
;-----------------------------------------------

;-------SAME LOOP USING IMPLICIT LOOP IN ASSEMBLY-------

MOV DL, 30H ; NO CONTRIBUTION IN INCREMENT, ONLY USED FOR PRINTING 
MOV AH, 2
MOV CX, 5 ; CX ALWAYS CONTAINS THE BOUND -> THE NUMBER OF TIME THE LOOP WILL RUN

START:
INT 21H ; System.out.println(x);
INC DL ; x++

LOOP START 
    
;-------------------------------------------------------

;exit to DOS
END:
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
