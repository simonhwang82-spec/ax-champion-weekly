@echo off
echo AX Weekly #04 서버 시작 중...

:: 기존 3000 포트 프로세스 종료
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :3000 ^| findstr LISTENING') do (
    taskkill /PID %%a /F >nul 2>&1
)

:: 서버 시작
start /B node "%~dp0server.js"

:: 잠시 대기 후 브라우저 오픈
timeout /t 2 /nobreak >nul
start http://localhost:3000

echo 브라우저가 열립니다. 이 창을 닫으면 서버가 종료됩니다.
echo 종료하려면 아무 키나 누르세요.
pause >nul

:: 서버 종료
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :3000 ^| findstr LISTENING') do (
    taskkill /PID %%a /F >nul 2>&1
)
echo 서버가 종료되었습니다.
