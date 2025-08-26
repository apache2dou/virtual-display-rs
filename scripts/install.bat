%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit

cd /d "%~dp0"
certutil -addstore -f root "WLTest.cer"
certutil -addstore -f TrustedPublisher "WLTest.cer"
reg import install.reg
.\nefconc.exe --remove-device-node --hardware-id Root\VirtualDisplayDriver --class-guid "4D36E968-E325-11CE-BFC1-08002BE10318"
.\nefconc.exe --create-device-node --class-name Display --class-guid "4D36E968-E325-11CE-BFC1-08002BE10318" --hardware-id Root\VirtualDisplayDriver
.\nefconc.exe --install-driver --inf-path ".\VirtualDisplayDriver.inf"
virtual-display-driver-cli.exe add  --name vmonitor0 1920x1080@60/90 2560x1440@60
virtual-display-driver-cli.exe persist
vdd-user-session-service.exe --install
sc start vdd-user-session-initializer
pause
