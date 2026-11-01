@echo off
setlocal
echo ==========================================
echo   Mechanic Developer Environment Setup
echo ==========================================

REM 1. Resolve desktop paths and bundled Lua architecture
echo.
echo [1/5] Detecting bundled Lua architecture...
set "SCRIPT_DIR=%~dp0"
set "DESKTOP_DIR=%SCRIPT_DIR%.."
pushd "%DESKTOP_DIR%"
set "ABS_DESKTOP_DIR=%CD%"
popd

set "LUA_EXE=%ABS_DESKTOP_DIR%\bin\lua.exe"
if not exist "%LUA_EXE%" (
    echo "[ERROR] Bundled lua.exe not found at: %LUA_EXE%"
    exit /b 1
)

set "LUA_ARCH="
for /f "usebackq delims=" %%A in (`powershell -NoProfile -ExecutionPolicy Bypass -Command "$fs=[System.IO.File]::OpenRead($env:LUA_EXE); $br=New-Object System.IO.BinaryReader($fs); try { [void]$fs.Seek(0x3C, 'Begin'); $peOffset=$br.ReadInt32(); [void]$fs.Seek($peOffset + 4, 'Begin'); $machine=$br.ReadUInt16(); if ($machine -eq 0x14c) { 'x86' } elseif ($machine -eq 0x8664) { 'x64' } else { 'unknown' } } finally { $br.Close(); $fs.Close() }"`) do set "LUA_ARCH=%%A"

if "%LUA_ARCH%"=="" set "LUA_ARCH=unknown"
if "%LUA_ARCH%"=="unknown" (
    echo "[ERROR] Could not determine Lua architecture from: %LUA_EXE%"
    exit /b 1
)

echo Bundled Lua architecture: %LUA_ARCH%

REM 2. Find matching Visual Studio Build Tools Environment
echo.
echo [2/5] Finding Visual Studio Build Tools...
set "VS_PATH="

if /I "%LUA_ARCH%"=="x86" (
    if exist "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars32.bat" (
        set "VS_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars32.bat"
    ) else if exist "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars32.bat" (
        set "VS_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars32.bat"
    ) else if exist "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars32.bat" (
        set "VS_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars32.bat"
    ) else if exist "C:\Program Files (x86)\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars32.bat" (
        set "VS_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars32.bat"
    )
) else (
    if exist "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat" (
        set "VS_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
    ) else if exist "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat" (
        set "VS_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"
    ) else if exist "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat" (
        set "VS_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
    ) else if exist "C:\Program Files (x86)\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat" (
        set "VS_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
    )
)

if "%VS_PATH%"=="" (
    echo [ERROR] Could not find Visual Studio Build Tools for Lua architecture %LUA_ARCH%.
    echo Please install VS Build Tools with "Desktop development with C++".
    exit /b 1
)

echo Found at: %VS_PATH%
call "%VS_PATH%" >NUL
echo Environment initialized.

REM 3. Verify Directories
echo.
echo [3/5] Verifying Dependencies...

set "LUA_INC=%ABS_DESKTOP_DIR%\include\lua\5.1"
set "LUA_LIB=%ABS_DESKTOP_DIR%\lib"

if not exist "%LUA_INC%\lua.h" (
    echo "[ERROR] Lua headers not found at: %LUA_INC%"
    exit /b 1
)
if not exist "%LUA_LIB%\lua5.1.lib" (
    echo "[ERROR] Lua library not found at: %LUA_LIB%"
    exit /b 1
)
echo Dependencies found.

REM 4. Configure Luarocks
echo.
echo [4/5] Configuring Luarocks...
REM Check if luarocks is in PATH
where luarocks >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] 'luarocks' command not found. Please install LuaRocks and add to PATH.
    echo Download: https://luarocks.org/
    exit /b 1
)

echo Setting variables.LUA_INCDIR...
luarocks --lua-version=5.1 config variables.LUA_INCDIR "%LUA_INC%"
echo Setting variables.LUA_LIBDIR...
luarocks --lua-version=5.1 config variables.LUA_LIBDIR "%LUA_LIB%"

REM 5. Install Busted
echo.
echo [5/5] Installing Busted...
luarocks --lua-version=5.1 install busted

echo.
echo ==========================================
echo   SUCCESS! 
echo   
echo   You can now run:
echo     mech call addon.test
echo     mech setup-busted
echo ==========================================
pause
