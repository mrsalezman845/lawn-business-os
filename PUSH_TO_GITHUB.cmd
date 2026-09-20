@echo off
setlocal EnableExtensions
cd /d "%~dp0"
title Lawn Business OS - Push to GitHub

echo ============================================================
echo   LAWN BUSINESS OS - ONE CLICK GITHUB UPLOAD
echo ============================================================
echo.
echo Target repo:
echo   https://github.com/mrsalezman845/lawn-business-os.git
echo.

set "GITEXE=git"
where git >nul 2>nul
if errorlevel 1 (
  if exist "C:\Program Files\Git\cmd\git.exe" (
    set "GITEXE=C:\Program Files\Git\cmd\git.exe"
  ) else (
    echo Git is not installed yet.
    where winget >nul 2>nul
    if errorlevel 1 goto NOGIT
    echo Installing Git for Windows now...
    winget install --id Git.Git -e --source winget --accept-package-agreements --accept-source-agreements
    if exist "C:\Program Files\Git\cmd\git.exe" (
      set "GITEXE=C:\Program Files\Git\cmd\git.exe"
    ) else (
      echo.
      echo Git finished installing, but Windows has not refreshed the path yet.
      echo Close this window and double-click PUSH_TO_GITHUB.cmd again.
      pause
      exit /b 1
    )
  )
)

echo [1/5] Initializing repository...
if not exist ".git" "%GITEXE%" init -b main

"%GITEXE%" config user.name "mrsalezman845"
"%GITEXE%" config user.email "mrsalezman845@users.noreply.github.com"

echo [2/5] Adding Lawn Business OS files...
"%GITEXE%" add -A

echo [3/5] Creating commit...
"%GITEXE%" diff --cached --quiet
if errorlevel 1 (
  "%GITEXE%" commit -m "Launch Lawn Business OS"
) else (
  echo No new local changes need committing.
)

echo [4/5] Connecting to your GitHub repository...
"%GITEXE%" remote remove origin >nul 2>nul
"%GITEXE%" remote add origin https://github.com/mrsalezman845/lawn-business-os.git

for /f "delims=" %%B in ('"%GITEXE%" branch --show-current') do set "BRANCH=%%B"
if not defined BRANCH (
  "%GITEXE%" checkout -B main
) else if /I not "%BRANCH%"=="main" (
  "%GITEXE%" branch -M main
)

echo [5/5] Uploading to GitHub...
echo.
echo GitHub may open your browser ONCE to confirm your account.
echo Approve/sign in if it asks, then come back to this window.
echo.
"%GITEXE%" push -u origin main
if errorlevel 1 goto PUSHFAIL

echo.
echo ============================================================
echo SUCCESS - Lawn Business OS is now in GitHub.
echo ============================================================
echo.
echo Repo:
echo https://github.com/mrsalezman845/lawn-business-os
echo.
echo Next: open the repo and check the Actions tab for the Pages deploy.
echo.
pause
exit /b 0

:NOGIT
echo.
echo Windows could not find Git or winget.
echo Install Git for Windows from https://git-scm.com/download/win
pause
exit /b 1

:PUSHFAIL
echo.
echo The app files are ready, but GitHub did not accept the push.
echo If a browser sign-in appeared, finish it and run this file again.
echo Do NOT create another repository.
pause
exit /b 1
