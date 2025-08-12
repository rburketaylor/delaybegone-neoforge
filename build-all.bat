@echo off
setlocal enabledelayedexpansion

set clean_flag=
if "%1"=="clean" (
    set clean_flag=clean
    echo Building DelayBeGone for all supported versions with clean...
) else (
    echo Building DelayBeGone for all supported versions...
)

echo Discovering versions from properties files...
set versions=
for %%f in (versions\*.properties) do (
    set filename=%%~nf
    if not "!filename!"=="common" (
        set versions=!versions! !filename!
    )
)

for %%v in (%versions%) do (
    echo.
    echo ========================================
    echo Building for Minecraft %%v
    echo ========================================
    call gradlew !clean_flag! build -PmcVersion=%%v
    if errorlevel 1 (
        echo ERROR: Build failed for version %%v
        pause
        exit /b 1
    )
    
    echo Moving build artifacts...
    if not exist "builds\%%v" mkdir "builds\%%v"
    copy "build\libs\*.jar" "builds\%%v\"
)

echo.
echo ========================================
echo All builds completed successfully!
echo Check the 'builds' folder for artifacts.
echo ========================================
pause