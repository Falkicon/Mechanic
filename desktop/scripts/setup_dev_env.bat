@echo off
setlocal
echo ==========================================
echo   Mechanic Developer Environment Setup
echo ==========================================

REM 1. Find Visual Studio Build Tools Environment
echo.
echo [1/4] Finding Visual Studio Build Tools...
set "VS_PATH="

if exist "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat" (
    set "VS_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
) else if exist "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat" (
    set "VS_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"
) else if exist "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat" (
    set "VS_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
) else if exist "C:\Program Files (x86)\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat" (
    set "VS_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
)

if "%VS_PATH%"=="" (
    echo [ERROR] Could not find Visual Studio Build Tools (vcvars64.bat).
    echo Please install VS Build Tools with "Desktop development with C++".
    exit /b 1
)

echo Found at: %VS_PATH%
call "%VS_PATH%" >NUL
echo Environment initialized.

REM 2. Verify Directories
echo.
echo [2/4] Verifying Dependencies...
set "SCRIPT_DIR=%~dp0"
set "DESKTOP_DIR=%SCRIPT_DIR%.."
pushd "%DESKTOP_DIR%"
set "ABS_DESKTOP_DIR=%CD%"
popd

set "LUA_INC=%ABS_DESKTOP_DIR%\include\lua\5.1"
set "LUA_LIB=%ABS_DESKTOP_DIR%\lib"

if not exist "%LUA_INC%\lua.h" (
    echo [ERROR] Lua headers not found at: %LUA_INC%
    exit /b 1
)
if not exist "%LUA_LIB%\lua5.1.lib" (
    echo [ERROR] Lua library not found at: %LUA_LIB%
    exit /b 1
)
echo Dependencies found.

REM 3. Configure Luarocks
echo.
echo [3/4] Configuring Luarocks...
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

REM 4. Install Busted
echo.
echo [4/4] Installing Busted...
luarocks --lua-version=5.1 install busted

echo.
echo ==========================================
echo   SUCCESS! 
echo   
echo   You can now run:
echo     mech call addon.test
echo ==========================================
pause
