@echo off
setlocal
set "LUAROCKS_SYSCONFDIR=C:\Program Files\luarocks"
"C:\Program Files (x86)\World of Warcraft\_dev_\!Mechanic\desktop\bin\lua.exe" -e "package.path=\"C:\\Users\\jasfalk\\AppData\\Roaming\\luarocks\\share\\lua\\5.1\\?.lua;C:\\Users\\jasfalk\\AppData\\Roaming\\luarocks\\share\\lua\\5.1\\?\\init.lua;\"..package.path;package.cpath=\"C:\\Users\\jasfalk\\AppData\\Roaming\\luarocks\\lib\\lua\\5.1\\?.dll;\"..package.cpath;local k,l,_=pcall(require,'luarocks.loader') _=k and l.add_context('busted','2.2.0-1')" "C:\Users\jasfalk\AppData\Roaming\luarocks\lib\luarocks\rocks-5.1\busted\2.2.0-1\bin\busted" %*
exit /b %ERRORLEVEL%
