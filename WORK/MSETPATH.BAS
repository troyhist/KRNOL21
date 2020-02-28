DECLARE FUNCTION SHTSTR$ (SSTR$, PAR%)
DEFINT A-Z
PRINT "Path convertor ver. 1.0"
PRINT "Current directory is - "; CURDIR$ + "\"
INPUT "Word to convert :      ", W$
W$ = W$ + STRING$(64 - LEN(W$), 32)
'INPUT "Filename :        ", F$
'INPUT "Offset :          ", Of
F$ = "KRNOL.CFG"
Of = 9
FOR I = 1 TO LEN(W$)
B$ = MID$(W$, I, 1)
C = ASC(B$)
D$ = CHR$(255 - C)
NW$ = NW$ + D$
NEXT I
PRINT "Old word :     ", W$
PRINT "New word :     ", NW$
OPEN "B", #1, F$
SEEK #1, Of
PUT #1, , NW$
CLOSE #1

FUNCTION SHTSTR$ (SSTR$, PAR%)
REM -------------------------------------------------------------------------
IF PAR% > 255 THEN PAR% = 255
IF PAR% < 0 THEN PAR% = 0
REM -------------------------------------------------------------------------
FOR I = 1 TO LEN(SSTR$)
B$ = MID$(SSTR$, I, 1)
C = ASC(B$)
D = PAR% - C
IF D < 0 THEN D = 255 + D
D$ = CHR$(D)
TEMP$ = TEMP$ + D$
NEXT I
REM -------------------------------------------------------------------------
SHTSTR$ = TEMP$
REM -------------------------------------------------------------------------
END FUNCTION

