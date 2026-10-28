@echo off
setlocal
if not exist lib mkdir lib
echo Downloading Java JAR libraries...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; Invoke-WebRequest 'https://repo.maven.apache.org/maven2/com/formdev/flatlaf/3.7.2/flatlaf-3.7.2.jar' -OutFile 'lib/flatlaf-3.7.2.jar'; Invoke-WebRequest 'https://repo.maven.apache.org/maven2/com/formdev/flatlaf-intellij-themes/3.7.2/flatlaf-intellij-themes-3.7.2.jar' -OutFile 'lib/flatlaf-intellij-themes-3.7.2.jar'; Invoke-WebRequest 'https://repo.maven.apache.org/maven2/com/mysql/mysql-connector-j/9.5.0/mysql-connector-j-9.5.0.jar' -OutFile 'lib/mysql-connector-j-9.5.0.jar'"
if errorlevel 1 (
  echo Download failed. Check your internet connection or download the JARs from the official sites listed in README.txt.
  pause
  exit /b 1
)
echo.
echo Done. JAR files are in the lib folder.
pause
