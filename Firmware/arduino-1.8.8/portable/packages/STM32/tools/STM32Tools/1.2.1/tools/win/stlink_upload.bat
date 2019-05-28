@echo off
rem: Note %~dp0 get path of this batch file
rem: Need to change drive if My Documents is on a drive other than C:
set driverLetter=%~dp0
set driverLetter=%driverLetter:~0,2%
%driverLetter%
cd %~dp0
rem: the two line below are needed to fix path issues with incorrect slashes before the bin file name
set str=%4
set str=%str:/=\%


rem: ------------- use STLINK CLI
rem: echo "" is mandatory to exit ST-Link_CLI tools w 3.0.0.0 when "-Run" option is used,
rem: it now wait Enter key press to quit.
echo "" | stlink\ST-LINK_CLI.exe -c SWD -P %str% 0x8000000 -Rst -Run
