MESS MACRO MSG
   MOV AH,09H
   LEA DX,MSG
   INT 21H
ENDM


.MODEL SMALL

.DATA
 
 N1 DB 04H
 N2 DB 08H
 MSG1 DB 0AH,0DH,"ENTER DIVIDEND : $"
 MSG2 DB 0AH,0DH, "QUOTIENT IS : $"
 MSG3 DB 0AH,0DH,"ENTER DIVISIOR : $"
 MSG4 DB 0AH,0DH,"REMAINDER IS : $"

.CODE

 MOV AX,@DATA
 MOV DS,AX

  MESS MSG1

  ;ACEEPTING 16 BIT NUMBER

  CALL ACCEPT
  rol al,04h
  mov bl,al

  CALL ACCEPT
  add bl,al

  MOV bh,bl

  CALL ACCEPT
  rol al,04h
  mov bl,al

  CALL ACCEPT
  add bl,al

  ;ACCEPTING 8 BIT NUMBER

  MESS MSG3

  CALL ACCEPT
  rol al,04h
  mov cl,al

  CALL ACCEPT
  add cl,al

  ;DIVISION OF 16 BIT BY 8 BIT


  MOV AX,BX
  DIV CL
  
  MOV BX,AX

  
  MESS MSG4

 
  MOV N1,BH
  ROR N1,04H
  MOV CL,N1
  CALL DISP
  
  
  ROR N1,04H
  MOV CL,N1
  CALL DISP
 

  MESS MSG2

  MOV N2,BL
  ROR N2,04H
  MOV CL,N2
  CALL DISP
  
  ROR N2,04H
  MOV CL,N2
  CALL DISP
  
 

  
  

  
ACCEPT PROC NEAR

  mov ah,01h
  int 21h


  cmp al,3ah
  jc down1

  sub al,07h

  down1: and al,0fh


RET
ENDP


DISP PROC NEAR

         
         AND CL,0FH
         CMP CL,0AH
         JC DOWN3
        
         ADD CL,07H
        
         DOWN3 : ADD CL,30H
		 
		  MOV DL,CL
		  MOV AH,02H
		  INT 21H

 RET
 ENDP

END


