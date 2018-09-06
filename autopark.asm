; Basic code for parallel & perpendicular parking subroutines
; Note: Measurements must be carefully taken. [X] denotes missing values.
; ===============[PARALLEL]===============
;	BOT POSITIONED A DISTANCE [X] FROM CANDIDATE SPOT.
;	PARKING STEPS:
;		1. TURN 90 DEGREES RIGHT
;		2. MOVE FORWARD [X]mm (ADD SONAR INTERRUPTS?)
;		3. TURN 90 DEGREES LEFT
ParallelPark:
	; STEP 1
	CALL Turn90R
	
	; STEP 2
	LOAD ParaDist	; Distance to travel into space [must be defined. NOTE: 0.05 mm/count inaccuracy to be accounted for]
	STORE AutoFdist	; Desired distance
	LOAD FSlow		; 100 mm/s
	CALL AutoForward
	
	; STEP 3
	CALL Turn90L
	RETURN


; ===============[PERPENDICULAR]===============
;	BOT POSITIONED A DISTANCE [X] FROM CANDIDATE SPOT.
;	PARKING STEPS:
;		1. TURN 90 DEGREES RIGHT
;		2. MOVE FORWARD [X]mm (ADD SONAR INTERRUPTS?)
PerpendicularPark:
	; STEP 1
	CALL Turn90R
	
	; STEP 2
	LOAD PerpDist	; Distance to travel into space [must be defined. NOTE: 0.05 mm/count inaccuracy to be accounted for]
	STORE AutoFdist	; Desired distance
	LOAD FSlow		; 100 mm/s
	CALL AutoForward
	RETURN