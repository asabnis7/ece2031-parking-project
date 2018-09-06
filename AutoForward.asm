; ===============[AUTOMATIC FORWARD]===============
;	MOVES BOT A CERTAIN DISTANCE FORWARD (PASSED IN)
;	DESIRED DISTANCE STORED IN: AutoFdist
;	DESIRED VELOCITY STORED IN: AutoFvel
AutoForward:
	LOAD 0
	OUT RESETPOS	; Reset odometry
	LOAD AutoFvel
	STORE Dvel		; Desired velocity
	LOAD 0
	STORE Dtheta	; Desired heading
AutoFLoop:
	IN XPOS			; Load distance bot traveled
	SUB AutoFdist	; Desired distance to travel
	ADDI 10 		; 10mm margin of error
	JNEG AutoFLoop	; Loop condition
	RETURN