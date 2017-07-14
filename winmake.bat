@ECHO OFF
REM Simple "make" script for Windows. Utilizes SWI Prolog's built-in compiler.
REM Default output is sasp.exe. An alternative output file can be specified
REM as a command-line argument, with or without the .exe extension.

IF [%1] == [] (
        SET PLEXE=sasp
) ELSE (
        SET PLEXE=%1
)

CD SRC

swipl -L0 -G0 -T0 --goal=main --stand_alone=true -o %PLEXE% -c main.pl

REM If user-supplied name included .exe, make sure not to append it again.
IF EXIST %PLEXE%.EXE (
        MOVE %PLEXE%.EXE ..
) ELSE (
        MOVE %PLEXE% ..
)

CD ..

GOTO :EOF
