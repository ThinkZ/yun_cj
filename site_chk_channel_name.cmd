@echo off
set CMD_NAME=%~n0
set CMD_PREFIX=%SITE_PREFIX%_chk_
call set CHANNEL_NAME=%%CMD_NAME:%CMD_PREFIX%=%%

rem echo %CMD_NAME% %CHANNEL_NAME%

set CMD_TITLE=%SITE_PREFIX%_%CHANNEL_NAME%_checking....
set CHECK_PROCESS=ffmpeg_%SITE_PREFIX%_%CHANNEL_NAME%

title %CMD_TITLE%

choice /t 5 /d n /m "wait 5 seconds to check %CHANNEL_NAME%"

tasklist /fo csv | find "%CHECK_PROCESS%"
goto answer%errorlevel%

:answer0
	echo status is ok
	goto endz
	
:answer1
	echo --------%CHECK_PROCESS% can't found!!! --------restart %SITE_PREFIX%_run_%CHANNEL_NAME%
	if not exist %SITE_PREFIX%_run_%CHANNEL_NAME%.cmd goto errNoCMD
	start /min %SITE_PREFIX%_run_%CHANNEL_NAME%.cmd
	goto endz

:errNoCMD
	echo ====%SITE_PREFIX%_run_%CHANNEL_NAME%.cmd can't found!!!    ====
	goto endz

:endz
	echo ====checked %SITE_PREFIX%_%CHANNEL_NAME%

