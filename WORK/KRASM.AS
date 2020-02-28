REM -------------------------------------------------------------------------
REM KRNOL.AS - Assembly Support Include File
REM -------------------------------------------------------------------------
TYPE RegType
     ax    AS INTEGER
     bx    AS INTEGER
     cx    AS INTEGER
     dx    AS INTEGER
     bp    AS INTEGER
     si    AS INTEGER
     di    AS INTEGER
     flags AS INTEGER
END TYPE
REM -------------------------------------------------------------------------
TYPE RegTypeX
     ax    AS INTEGER
     bx    AS INTEGER
     cx    AS INTEGER
     dx    AS INTEGER
     bp    AS INTEGER
     si    AS INTEGER
     di    AS INTEGER
     flags AS INTEGER
     ds    AS INTEGER
     es    AS INTEGER
END TYPE
REM -------------------------------------------------------------------------
DECLARE SUB Interrupt (intnum AS INTEGER, inreg AS RegType, outreg AS RegType)
REM -------------------------------------------------------------------------
DECLARE SUB InterruptX (intnum AS INTEGER, inreg AS RegTypeX, outreg AS RegTypeX)
REM -------------------------------------------------------------------------
DECLARE SUB Absolute (address AS INTEGER)
REM -------------------------------------------------------------------------
DECLARE SUB Int86Old (intnum AS INTEGER, inarray() AS INTEGER, outarray() AS INTEGER)
REM -------------------------------------------------------------------------
DECLARE SUB Int86XOld (intnum AS INTEGER, inarray() AS INTEGER, outarray() AS INTEGER)
REM -------------------------------------------------------------------------

