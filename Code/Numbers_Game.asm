MOV 18h, #41d

waitForClearance:
MOV P0, #11111110b
MOV A, P1
CJNE A, #11111111b, waitForClearance
MOV P0, #11111101b
MOV A, P1
CJNE A, #11111111b, waitForClearance
MOV P0, #11111011b
MOV A, P1
CJNE A, #11111111b, waitForClearance

checkallInput:
MOV P0, #11111110b
Mov B, #0h
call checkinput
MOV P0, #11111101b
Mov B, #3h
call checkinput
MOV P0, #11111011b
Mov B, #6h
call checkinput
jmp checkallInput

checkInput:
MOV A, P1
CJNE A, #11111110b, nextInput1
MOV A, #1d
ADD A, B
jmp evaluateInput
nextInput1:
CJNE A, #11111101b, nextInput2
MOV A, #2d
ADD A, B
jmp evaluateInput
nextInput2:
CJNE A, #11111011b, back
MOV A, #3d
ADD A, B
jmp evaluateInput
back:
ret

evaluateInput:
CJNE R0, #0d, finishInput
INC R0
MOV B, A
MOV A, #0d
MOV R3, #10d
call multiplyABy10
MOV R1, A
jmp waitforclearance

multiplyABy10:
ADD A, B
DJNZ R3, multiplyaby10
ret


finishInput:
MOV R0, #0d
ADD A, R1
CJNE A, 18h, compareNumbers
jmp gameWon

compareNumbers:
MOV B, 18h

decA:
DJNZ A, decB
jmp smallerthenNumber
decB:
DJNZ B, decA
jmp biggerthenNumber

smallerthenNumber:
MOV P2, #11111111b
MOV P2, #11000110b
jmp waitforclearance
biggerthenNumber:
MOV P2, #11111111b
MOV P2, #11110000b
jmp waitforclearance
gameWon:
MOV P2, #11111111b
MOV P2, #11110110b
end