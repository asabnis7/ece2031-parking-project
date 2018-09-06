; Move forward subroutine. Waits for stop signal from user.
; Play: Forward		0: Stop
Forward:
	LOAD 0
	OUT RESETPOS	   ; Reset odometry
	LOAD   FMid 	   ; 350 mm/s
	STORE  Dvel		   ; Desired forward velocity
	LOADI  0		   ; 0 degree turn (straight)
	STORE  DTheta	   ; Desired heading
WaitStopF:			   ; Wait for stop input
	CALL   IRDisp	   ; Display IR code 	
	IN	   IR_LO	   ; Load most-significant half of IR word (address)
	AND	   HighByte	   ; Extract most-significant byte
	SUB	   B0	       ; Subtract button 0 hex value
	JNEG   WaitStopF
	JPOS   WaitStopF
	OUT    IR_LO
	RETURN
	
; Move backward subroutine. Waits for stop signal from user.
; Play: Backward     0: Stop
Backward:
	LOAD 0
	OUT RESETPOS	   ; Reset odometry
	LOAD   RSlow 	   ; -100 mm/s
	STORE  Dvel		   ; Desired forward velocity
	LOADI  0		   ; 0 degree turn (straight)
	STORE  DTheta	   ; Desired heading
WaitStopR:			   ; Wait for stop input
	CALL   IRDisp	   ; Display IR code 	
	IN	   IR_LO	   ; Load most-significant half of IR word (address)
	AND	   HighByte	   ; Extract most-significant byte
	SUB	   B0	       ; Subtract button 0 hex value
	JNEG   WaitStopR
	JPOS   WaitStopR
	OUT    IR_LO
	RETURN