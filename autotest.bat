@ECHO OFF
SET TESTSCRIPT=.\test.bat
SET EXPECTED=.\expected_test_output.txt

CALL %TESTSCRIPT% > temptest.txt
diff %EXPECTED% temptest.txt
IF errorlevel 1 (
        ECHO ONE OR MORE TESTS FAILED!
) ELSE (
        ECHO ALL TESTS PASSED!
)
RM temptest.txt
PAUSE.
GOTO :EOF