@echo off
set NODE_EXE=C:\Users\nosib\AppData\Local\Programs\cursor\resources\app\resources\helpers\node.exe
if exist "%NODE_EXE%" (
  "%NODE_EXE%" server.js
) else (
  echo Node executable not found at:
  echo %NODE_EXE%
  exit /b 1
)
