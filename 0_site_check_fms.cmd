@echo off
set SITE_PREFIX=cutv

title %SITE_PREFIX%_fms_live_check
echo ===================================
choice /t 10 /d n /m "wait 10 seconds to next round"
for /f %%i in ('dir %SITE_PREFIX%_chk_*.cmd/b') do (
	call %%i %SITE_PREFIX%
	)
echo ===================================

%0
