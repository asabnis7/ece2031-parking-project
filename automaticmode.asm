; ===============[AUTOMATIC PARKING]===============
;	BOT STARTS IN SET POSITION. MUST TRAVEL TO DESIGNATED 
;	PERPENDICULAR SPOT AND PARK. ONLY USER INPUT IS 
;	FOR SPOT (BUTTONS 1-7)
;	PARKING STEPS:
;		1. TRAVEL [X]mm FORWARD
;		2. TURN RIGHT
;		3. TRAVEL [X]mm FORWARD
;		4. TURN LEFT
;		5. PROCEED DISTANCE [X]mm TO DESIGNATED SPACE
;		6. PARK IN SPACE
AutomaticMode:
	; STEP 1
	LOAD Auto1		; Distance to travel forward out of start
	STORE AutoFdist	; Desired distance
	LOAD FMid		; 350 mm/s
	CALL AutoForward

	; STEP 2
	CALL Turn90R
	
	; STEP 3
	LOAD Auto2		; Distance to travel toward row of perp spaces
	STORE AutoFdist	; Desired distance
	LOAD FMid		; 350 mm/s
	CALL AutoForward
	
	; STEP 4
	CALL Turn90L
	
	; STEP 5
	LOAD SpaceDist	; Distance to travel to designated space
					; [Value determined by user button press]
	STORE AutoFdist	; Desired distance
	LOAD FMid		; 350 mm/s
	CALL AutoForward
	
	; STEP 6
	CALL PerpendicularPark
	RETURN