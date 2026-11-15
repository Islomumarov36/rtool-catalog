@echo off
chcp 65001 >nul
cd /d "%~dp0"
setlocal enabledelayedexpansion

rem ===== Git'ni qayerda bo'lsa ham topamiz =====
set "GIT="
rem 1) PATH
for /f "delims=" %%P in ('where git 2^>nul') do if not defined GIT set "GIT=%%P"
rem 2) Standart o'rnatmalar
for %%G in (
  "%ProgramFiles%\Git\cmd\git.exe"
  "%ProgramFiles(x86)%\Git\cmd\git.exe"
  "%LocalAppData%\Programs\Git\cmd\git.exe"
) do if not defined GIT if exist "%%~G" set "GIT=%%~G"
rem 3) GitHub Desktop ichidagi git
if not defined GIT for /f "delims=" %%P in ('dir /b /s "%LocalAppData%\GitHubDesktop\git.exe" 2^>nul ^| findstr /i "\\cmd\\git.exe"') do if not defined GIT set "GIT=%%P"
rem 4) Visual Studio ichidagi git
if not defined GIT for /f "delims=" %%P in ('dir /b /s "%ProgramFiles%\Microsoft Visual Studio\git.exe" 2^>nul ^| findstr /i "\\cmd\\git.exe"') do if not defined GIT set "GIT=%%P"
if not defined GIT for /f "delims=" %%P in ('dir /b /s "%ProgramFiles(x86)%\Microsoft Visual Studio\git.exe" 2^>nul ^| findstr /i "\\cmd\\git.exe"') do if not defined GIT set "GIT=%%P"

if not defined GIT (
  echo [!] Git hech qayerda topilmadi.
  echo     https://git-scm.com/download/win dan ornating ^(Next-Next-Install^), keyin qayta oching.
  pause
  exit /b
)

echo Git topildi: "!GIT!"
echo.

if not exist ".git" "!GIT!" init
"!GIT!" add .
"!GIT!" -c user.email=rtool@local -c user.name=RTool commit -m "RTool catalog + APKs" 2>nul
"!GIT!" branch -M main
"!GIT!" remote remove origin 2>nul
"!GIT!" remote add origin https://github.com/Islomumarov36/rtool-catalog.git

echo === GitHub bilan birlashtirilmoqda (repo'da fayl bo'lsa) ===
"!GIT!" pull origin main --allow-unrelated-histories --no-edit 2>nul

echo.
echo === GitHub'ga yuborilmoqda (login so'ralsa, hisobingiz bilan kiring/avtorizatsiya) ===
"!GIT!" push -u origin main

echo.
echo Agar xato bo'lmasa - TAYYOR: https://github.com/Islomumarov36/rtool-catalog
echo.
pause
