@echo off

set INPUT_LIVE=<rtmp_source_live_app_url>/%CHANNEL_NAME%
set OUTPUT_LIVE=<rtmp_target_live_app_url>/%CHANNEL_NAME%
set FFMPEG_BIN=d:\ffmpeg\bin\

title %SITE_PREFIX%_%CHANNEL_NAME%_running
path %FFMPEG_BIN%;%path%

echo %CHECK_PROCESS%.exe -i "%INPUT_LIVE% live=1"  -acodec copy -vcodec copy -f flv "%OUTPUT_LIVE%"
if not exist %CHECK_PROCESS%.exe goto noErrEXE
%CHECK_PROCESS%.exe -i "%INPUT_LIVE% live=1"  -acodec copy -vcodec copy -f flv "%OUTPUT_LIVE%"
goto endz

:NoErrEXE
	echo -=-=-=-=%CHECK_PROCESS%.exe not found-=-=-=-=-=
	goto endz

:endz
choice /t 20 /d n /m "%CHECK_PROCESS% runnning now"
exit

