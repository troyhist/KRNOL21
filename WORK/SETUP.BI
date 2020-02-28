REM -------------------------------------------------------------------------
REM SETUP.BI include file ver. 1.0
REM -------------------------------------------------------------------------
TYPE VIDEO
        card AS STRING * 24
END TYPE
REM -------------------------------------------------------------------------
TYPE MUSIC
        card AS STRING * 24
END TYPE
REM -------------------------------------------------------------------------
TYPE COMPUTER
        speed AS INTEGER
        name  AS STRING * 24
END TYPE
REM -------------------------------------------------------------------------
DIM SHARED VIDEO(9) AS VIDEO
DIM SHARED MUSIC(7) AS MUSIC
DIM SHARED PC(10) AS COMPUTER
REM -------------------------------------------------------------------------
VIDEO(0).card = "Error"
VIDEO(1).card = "CGA-mono"
VIDEO(2).card = "CGA-colour"
VIDEO(3).card = "EGA"
VIDEO(4).card = "RES0"
VIDEO(5).card = "RES1"
VIDEO(6).card = "VGA-grey"
VIDEO(7).card = "VGA-standart"
VIDEO(8).card = "SVGA (640x480x200)"
VIDEO(9).card = "RES2"
REM -------------------------------------------------------------------------
MUSIC(0).card = "No Sound/Music"
MUSIC(1).card = "PC-Speaker"
MUSIC(2).card = "AdLib"
MUSIC(3).card = "SB-mono-8"
MUSIC(4).card = "SB-PRO-8"
MUSIC(5).card = "SB-Stereo"
MUSIC(6).card = "RES0"
MUSIC(7).card = "RES1"
REM -------------------------------------------------------------------------
PC(0).speed = 0
PC(0).name = "RES0"
PC(1).speed = 1
PC(1).name = "PC-XT"
PC(2).speed = 8
PC(2).name = "PC-XT (turbo)"
PC(3).speed = 16
PC(3).name = "PC-AT 286"
PC(4).speed = 25
PC(4).name = "AT 386SX"
PC(5).speed = 33
PC(5).name = "AT 386DX"
PC(6).speed = 40
PC(6).name = "AT 486SX"
PC(7).speed = 66
PC(7).name = "AT 486DX/DX2"
PC(8).speed = 75
PC(8).name = "Pentium-75"
PC(9).speed = 90
PC(9).name = "Pentium-90"
PC(10).speed = 100
PC(10).name = "Pentium-100"
REM -------------------------------------------------------------------------

