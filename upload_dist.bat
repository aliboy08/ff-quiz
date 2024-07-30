@echo off
setlocal

set install_name=devlibrary2021
set plugin_name=PLUGIN_NAME_HERE

REM Set variables
set remote_base_dir=/sites/%install_name%/plugins/%plugin_name%/
set ssh_host=%install_name%@%install_name%.ssh.wpengine.net

echo Preparing dist files...

@REM create dist_temp folder
if not exist "dist_temp" (
    mkdir dist_temp
)

@REM copy dist files to temp folder
echo Y | xcopy "dist\*" "dist_temp\" /E /H /C /I /Q /Y

echo Uploading dist files...
@REM upload dist_temp to wpengine
scp -r dist_temp %ssh_host%:%remote_base_dir%

echo Moving dist files...
@REM on remote / wpengine
@REM remove current files in dist folder
@REM transfer files in dist_temp to dist
@REM remove dist_temp
@REM clear wpengine cache
ssh %ssh_host% "cd %remote_base_dir% && mkdir -p dist && rm -rf dist/* && rsync -rvP dist_temp/ dist/ && rm -rf dist_temp && cd ~ && wp cache flush"

@REM remove local dist_temp
if exist "dist_temp" (
    rd /s /q "dist_temp"
)

endlocal
@REM pause
exit /b