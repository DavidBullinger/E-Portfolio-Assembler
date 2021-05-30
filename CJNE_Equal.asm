MOV A, #13d
CALL checkAll
MOV 22h, 0h ;Senceless line just to show that here would the program continue

checkAll:
check11:
CJNE A, #11d, check13
MOV B, #1d
ret
check13:
CJNE A, #13d, check30
MOV B, #1d
ret
check30:
CJNE A, #30d, finish
MOV B, #1d
ret
finish:
ret