REM -------------------------------------------------------------------------
REM KResstiki-NOLiki include file ver. 2.0
REM -------------------------------------------------------------------------
DECLARE FUNCTION chkCFG% ()
DECLARE FUNCTION chkDSPACE& ()
DECLARE FUNCTION chkPACKED% ()
DECLARE FUNCTION chkSETUP% ()
DECLARE FUNCTION DEINT% (HEXDT0%, HEXDT1%)
DECLARE FUNCTION gameARH% ()
DECLARE FUNCTION gameUNARH% ()
DECLARE FUNCTION GETUD% ()
DECLARE FUNCTION GETCOMPFIG% ()
DECLARE FUNCTION GETCOMPMOVE% ()
DECLARE FUNCTION GETLR% ()
DECLARE FUNCTION PLAYAGAIN% ()
DECLARE FUNCTION SHOWINTRO% ()
DECLARE FUNCTION SHTSTR$ (SSTR$, PAR%)
REM -------------------------------------------------------------------------
DECLARE SUB chkMAIN ()
DECLARE SUB CREATWORKSCR (PAR%, NPTH$)
DECLARE SUB EXITGAME ()
DECLARE SUB GETPLAYERMOVE ()
DECLARE SUB HALLOFFAME ()
DECLARE SUB LOSER (FIG%)
DECLARE SUB PALLOAD (PLOD$)
DECLARE SUB PRKEY ()
DECLARE SUB SCROFF (PAR%)
DECLARE SUB SETPAL (SEGM%, OFFS%)
DECLARE SUB SHOWERR (WHY%, ERRNUM%)
DECLARE SUB SHOWPOINT (X%, Y%)
DECLARE SUB SHOWSPRITE (XCOR%, YCOR%, FIG%)
DECLARE SUB SNDPLAY (FLNM$)
DECLARE SUB VGALOAD (VLOD$)
REM -------------------------------------------------------------------------
TYPE KRNOLMAP
	attrib AS INTEGER
	reserv AS INTEGER
END TYPE
REM -------------------------------------------------------------------------
TYPE CFGheader
	initCFG AS STRING * 6
	gameTC  AS INTEGER
	path    AS STRING * 64
	user    AS STRING * 256
	sernum  AS INTEGER
	video   AS INTEGER
	sound   AS INTEGER
	music   AS INTEGER
	speed   AS INTEGER
END TYPE
REM -------------------------------------------------------------------------
TYPE HOFheader
	inetHOF AS STRING * 6
	gameTC  AS INTEGER
	res0    AS INTEGER
	res1    AS INTEGER
	res2    AS INTEGER
	res3    AS INTEGER
	res4    AS INTEGER
	res5    AS INTEGER
	res6    AS INTEGER
	res7    AS INTEGER
	res8    AS INTEGER
	res9    AS INTEGER
	name0   AS STRING * 64
	name1   AS STRING * 64
	name2   AS STRING * 64
	name3   AS STRING * 64
	name4   AS STRING * 64
	name5   AS STRING * 64
	name6   AS STRING * 64
	name7   AS STRING * 64
	name8   AS STRING * 64
	name9   AS STRING * 64
END TYPE
REM -------------------------------------------------------------------------
TYPE GRAPHSMAP
	cursorX AS INTEGER
	cursorY AS INTEGER
	figureX AS INTEGER
	figureY AS INTEGER
END TYPE
REM -------------------------------------------------------------------------
TYPE PALD
	color AS STRING * 3
END TYPE
REM -------------------------------------------------------------------------
DIM SHARED KRNOLMAP(1 TO 3, 1 TO 3) AS KRNOLMAP
DIM SHARED CFG AS CFGheader
DIM SHARED HOF AS HOFheader
DIM SHARED GRP(3, 3) AS GRAPHSMAP
DIM SHARED PALS(1 TO 256) AS PALD
DIM SHARED ERRS(0 TO 255) AS STRING * 64
DIM SHARED OCAS(0 TO 89) AS STRING * 64
DIM SHARED LSTF(1 TO 89) AS STRING * 64
'DIM SHARED CURSORL(263) AS INTEGER
'DIM SHARED CURSORR(263) AS INTEGER
REM -------------------------------------------------------------------------
CONST STR0$ = "┤нЪМЛЦФЦ╥▒░│ЦФЦ▀ЙЪН╤▀═╤╬"
CONST STR1$ = "лНРЖ▀ЬРТПКЛЦСШ╙▀╢СЬ╤"
CONST STR2$ = "┤РУЪЙЮЛРИ▀мЪНШЪЖ▀╫Ь╓▀╬╞╞╔"
CONST SUSR$ = "┤РУЪЙЮЛРИ▀мЪНШЪЖ▀йУЮЫЦТЦНРИЦЬЧ"
REM -------------------------------------------------------------------------
CONST BASFILE$ = "KRNOL.BAS", EXEFILE$ = "KRNOL.EXE", LSTFILE$ = "KRNOL.LST"
CONST CFGFILE$ = "KRNOL.CFG", HOFFILE$ = "KRNOL.HOF", ARHFILE$ = "KRNOL.ARH"
CONST REDFILE$ = "READY.EXE"
REM -------------------------------------------------------------------------
CONST GRAPHSDIR$ = "GRAPHS\", SOUNDDIR$ = "SOUND\", PROGSDIR$ = "PROGS\"
REM -------------------------------------------------------------------------
CONST dSETUP = 15, DISKsp = 16, fSETUP = 17
REM -------------------------------------------------------------------------
CONST SK = 1, PLAYER% = 1, COMPUTER% = 2, KREST% = 1, NOLIK% = 2
CONST YES% = 1, NO% = 0
REM -------------------------------------------------------------------------
GRP(1, 1).figureX = 120: GRP(2, 1).figureX = 153: GRP(3, 1).figureX = 186
GRP(1, 1).figureY = 60:  GRP(2, 1).figureY = 60:  GRP(3, 1).figureY = 60
GRP(1, 2).figureX = 120: GRP(2, 2).figureX = 153: GRP(3, 2).figureX = 186
GRP(1, 2).figureY = 92:  GRP(2, 2).figureY = 92:  GRP(3, 2).figureY = 92
GRP(1, 3).figureX = 120: GRP(2, 3).figureX = 153: GRP(3, 3).figureX = 186
GRP(1, 3).figureY = 125: GRP(2, 3).figureY = 125: GRP(3, 3).figureY = 125
REM -------------------------------------------------------------------------
GRP(1, 1).cursorX = 120: GRP(2, 1).cursorX = 153: GRP(3, 1).cursorX = 186
GRP(1, 1).cursorY = 78:  GRP(2, 1).cursorY = 78:  GRP(3, 1).cursorY = 78
GRP(1, 2).cursorX = 120: GRP(2, 2).cursorX = 153: GRP(3, 2).cursorX = 186
GRP(1, 2).cursorY = 111: GRP(2, 2).cursorY = 111: GRP(3, 2).cursorY = 111
GRP(1, 3).cursorX = 120: GRP(2, 3).cursorX = 153: GRP(3, 3).cursorX = 186
GRP(1, 3).cursorY = 144: GRP(2, 3).cursorY = 144: GRP(3, 3).cursorY = 144
REM -------------------------------------------------------------------------
CONST COL0% = 0, COL1% = 248
CONST COL2% = 247, COL3% = 161
REM -------------------------------------------------------------------------
CONST BLK% = 0, WHT% = 255
REM -------------------------------------------------------------------------
CONST POINTL% = 129, LEFT% = 1
CONST POINTR% = 160, RIGHT% = 2
CONST POINTT% = 150
REM -------------------------------------------------------------------------
CONST INTROX0% = 130, INTROY0% = 35
CONST INTROX1% = 180, INTROY1% = 89
CONST INTROX2% = 180, INTROY2% = 141
REM -------------------------------------------------------------------------
OCAS(0) = "Not detected"
OCAS(15) = "chkSETUP%"
OCAS(16) = "chkDSPACE%"
OCAS(17) = "chkPACKED%"
REM -------------------------------------------------------------------------
ERRS(6) = "Overflow (DATA or smt ELSE)"
ERRS(53) = "File not found (yet)"
REM -------------------------------------------------------------------------

