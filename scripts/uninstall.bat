%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit

cd /d "%~dp0"
sc stop vdd-user-session-initializer
vdd-user-session-service.exe --uninstall
.\nefconc.exe --remove-device-node --hardware-id Root\VirtualDisplayDriver --class-guid "4D36E968-E325-11CE-BFC1-08002BE10318"
reg import uninstall.reg
pause