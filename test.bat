@ECHO OFF
REM s(ASP) test script. The first line of each file tested should be a
REM comment listing the expected output for execution with 'sasp -a'.
REM To test a specific file, it can be given as a commandline argument.
REM SET PLASP=casp

SET TXT=lp
SET TDIR=test

IF [%1]==[] (
        CALL :asptest test1
        CALL :asptest test2
        CALL :asptest test3
        CALL :asptest test4
        CALL :asptest test5
        CALL :asptest test6
        CALL :asptest test7
        CALL :asptest test8
        CALL :asptest test9
        CALL :asptest test10
        CALL :asptest test11
        CALL :asptest test12
        CALL :asptest test13
        CALL :asptest test14
        CALL :asptest test15
        CALL :asptest test16
        CALL :asptest test17
        CALL :asptest test18
        CALL :asptest test19
        CALL :asptest test20
        CALL :asptest test21
        CALL :asptest family
        CALL :asptest directive_test
        CALL :asptest multitest
        CALL :asptest abdbirds
        CALL :asptest queens
) ELSE (
        CALL :asptest %1
)
GOTO :EOF

REM Test a single file, given as the argument to asptest.
REM Usage: CALL :asptest filename
:asptest
SET TPROG=%TDIR%\%1.%TXT%
SET /P ANS=<%TPROG%
ECHO TEST %1: %ANS%
CALL casp.bat -a -s0 %TPROG%
ECHO.
GOTO :EOF
