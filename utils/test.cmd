@echo off

:: testing message module
:: testing default alert type
call ".\utils\message.cmd" "[TEST] MESSAGE MODULE"
:: testing danger alert type
call ".\utils\message.cmd" "[TEST] MESSAGE MODULE" "danger"
:: testing error alert type
call ".\utils\message.cmd" "[TEST] MESSAGE MODULE" "error"