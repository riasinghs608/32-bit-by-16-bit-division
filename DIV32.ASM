MESS MACRO MSG
   MOV AH,09H
   LEA DX,MSG
   INT 21H
ENDM


.MODEL SMALL

.DATA
 
 N1 DW 0000H
 N2 DW 0000H
 N3 DW 0000H

 MSG1 DB 0AH,0DH,"ENTER DIVIDEND : $"
 MSG2 DB 0AH,0DH, "QUOTIENT IS : $"
 MSG3 DB 0AH,0DH,"ENTER DIVISIOR : $"
 MSG4 DB 0AH,0DH,"REMAINDER IS : $"

.CODE

 MOV AX,@DATA
 MOV DS,AX

  MESS MSG1
  
  ;ACCEPTING 1st HALF OF 32 BIT NUMBER
  
  CALL ACCEPT
  rol AL,04h
  mov DL,al

  CALL ACCEPT
  add DL,al

  MOV DH,DL

  CALL ACCEPT
  rol AL,04h
  mov DL,al

  CALL ACCEPT
  add DL,al

  MOV N3,DX


  ;ACEEPTING 2nd half of 32 BIT NUMBER

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
  
  MOV n1,BX
  
  
   ;ACCEPTING 16bit number
  MESS MSG3
  
  CALL ACCEPT
  rol AL,04h
  mov bl,al

  CALL ACCEPT
  add bl,al

  MOV bh,bl

  CALL ACCEPT
  rol AL,04h
  mov bl,al

  CALL ACCEPT
  add bl,al
  

  
  ;DIVISION OF 32 BIT BY 16 BIT

  MOV AX,N1
  MOV DX,N3
  DIV bx
  
  mov N2,ax
  MOV N3,DX
  
  
  MESS MSG4

 
  MOV BX,N3
  MOV CH,BH
  ROR CH,04H
  MOV CL,CH
  CALL DISP
  
 
  ROR CH,04H
  MOV CL,CH
  CALL DISP
  
  MOV BX,N3
  MOV CH,BL
  ROR CH,04H
  MOV CL,CH
  CALL DISP
  
  
  ROR CH,04H
  MOV CL,CH
  CALL DISP
 

  MESS MSG2

  MOV BX,N2 
  MOV CH,BH
  ROR CH,04H
  MOV CL,CH
  CALL DISP
  
  ROR CH,04H
  MOV CL,CH
  CALL DISP
  
  
  MOV BX,N2
  MOV CH,BL
  ROR CH,04H
  MOV CL,CH
  CALL DISP
  
  ROR CH,04H
  MOV CL,CH
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


