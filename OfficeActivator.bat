@echo off
net session >nul 2>&1
if %errorLevel% == 0 (
	if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
		cd /d %ProgramFiles%\Microsoft Office\Office16
	) else (
		cd /d %ProgramFiles(x86)%\Microsoft Office\Office16
	)
	start /B cmd /C (
		for /f %x in ('dir /b ..\root\Licenses16\ProPlus2021VL_KMS*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%x"
	)
	start /B cmd /C (
		cscript ospp.vbs /setprt:1688
		cscript ospp.vbs /unpkey:6F7TH >nul
		cscript ospp.vbs /inpkey:FXYTK-NJJ8C-GB6DW-3DYQT-6F7TH
		cscript ospp.vbs /sethst:e8.us.to
		cscript ospp.vbs /act
	)
) else (
	echo Para poder activar Office, debes abrir el archivo seleccionando la opcion de Ejecutar como Administrador.
)
pause