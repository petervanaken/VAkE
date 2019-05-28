@echo off

set ERROR=0
set STM32CP_CLI=STM32_Programmer_CLI.exe
set ADDRESS=0x8000000

:: Check tool
where /Q %STM32CP_CLI%
if %errorlevel%==0 goto :param
::Check with default path
set STM32CP=%ProgramW6432%\STMicroelectronics\STM32Cube\STM32CubeProgrammer\bin
set STM32CP86=%ProgramFiles(X86)%\STMicroelectronics\STM32Cube\STM32CubeProgrammer\bin
set PATH=%PATH%;%STM32CP%;%STM32CP86%
where /Q %STM32CP_CLI%
if %errorlevel%==0 goto :param
echo %STM32CP_CLI% not found.
echo Please install it or add ^<STM32CubeProgrammer path^>\bin' to your PATH environment:
echo https://www.st.com/en/development-tools/stm32cubeprog.html
echo Aborting!
exit 1

:param
:: Parse options
if "%~1"=="" echo Not enough arguments! & set ERROR=2 & goto :usage
if "%~2"=="" echo Not enough arguments! & set ERROR=2 & goto :usage
set FILEPATH=%~2

:: Protocol
:: 0: SWD
:: 1: Serial
:: 2: DFU
if %~1==0 goto :SWD
if %~1==1 goto :SERIAL
if %~1==2 goto :DFU
echo Protocol unknown!
set ERROR=4
goto :usage

:SWD
set PORT=SWD
set MODE=mode=UR
goto :opt

:SERIAL
if "%~3"=="" set ERROR=3 & goto :usage
set PORT=%~3
shift
goto :opt

:DFU
set PORT=USB1
goto :opt

:opt
shift
shift
if "%~1"=="" goto :prog
set OPTS=%*
goto :prog

:prog
%STM32CP_CLI% -c port=%PORT% %MODE% -q -d %FILEPATH% %ADDRESS% %OPTS%
exit 0

:usage
  echo %0 ^<protocol^> ^<file_path^> [OPTIONS]
  echo.
  echo protocol:
  echo   0: SWD
  echo   1: Serial
  echo   2: DFU
  echo file_path: file path name to be downloaded: (bin, hex)
  echo Options:
  echo   For SWD and DFU: no mandatory options
  echo   For Serial: ^<com_port^>
  echo     com_port: serial identifier (mandatory). Ex: COM15
  echo.
  echo Note: all trailing arguments will be passed to the  %STM32CP_CLI%
  echo   They have to be valid commands for STM32 MCU
  echo   Ex: -g: Run the code at the specified address
  echo       -rst: Reset system
  echo       -s: start automatically (optional)
  exit %ERROR%
