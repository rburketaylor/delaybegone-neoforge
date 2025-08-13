@echo off
setlocal enabledelayedexpansion

set clean_flag=
set full_mode=false

if "%1"=="clean-cache" (
    echo Cleaning all build caches...
    if exist "build-cache" rmdir /s /q "build-cache"
    echo All build caches cleared.
    pause
    exit /b 0
)
if "%1"=="clean" (
    set clean_flag=clean
    echo Building DelayBeGone for all supported versions with clean...
)
if "%1"=="full" (
    set full_mode=true
    echo Building DelayBeGone for all supported versions with full build...
)
if "%1"=="clean-full" (
    set clean_flag=clean
    set full_mode=true
    echo Building DelayBeGone for all supported versions with clean + full build...
)
if "%2"=="full" (
    set clean_flag=clean
    set full_mode=true
    echo Building DelayBeGone for all supported versions with clean + full build...
)

if "%full_mode%"=="false" (
    echo Building DelayBeGone for all supported versions (fast mode)...
    echo Use 'clean-cache' to clear all build caches if needed.
)

rem Ensure clean daemon state for reliable multi-version builds
echo Stopping any existing daemons...
call gradlew --stop

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
    
    rem Clean build directory to avoid copying old artifacts
    if exist "build\libs\*.jar" del "build\libs\*.jar"
    
    rem Stop daemon before each build to prevent memory accumulation
    call gradlew --stop
    
    rem Use separate project cache directory for each version to enable caching
    
    if "%full_mode%"=="true" (
        call gradlew %clean_flag% build -PmcVersion=%%v --project-cache-dir=build-cache\%%v
    ) else (
        call gradlew %clean_flag% jar -x test -x javadoc -PmcVersion=%%v --project-cache-dir=build-cache\%%v
    )
    
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