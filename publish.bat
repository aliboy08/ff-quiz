@echo off
setlocal

set "source_path=%CD%"
set "plugin_name=plugin-boilerplate"
set "exclude=node_modules;.git;_temp;zip.ps1;publish.bat,.gitignore,jsconfig.json,package.json,package-lock.json,wp-manifest.cjs,vite.config.js"

echo Creating zip file...

REM Pass variables to PowerShell script
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0zip.ps1" -source_path "%source_path%" -plugin_name "%plugin_name%" -exclude "%exclude%"

endlocal
pause