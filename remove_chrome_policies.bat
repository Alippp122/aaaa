@echo off

REM Delete the registry keys
reg delete "HKEY_CURRENT_USER\Software\Google\Chrome" /f
reg delete "HKEY_CURRENT_USER\Software\Policies\Google\Chrome" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Google\Chrome" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome" /f
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Google\Update" /f
reg delete "HKEY_LOCAL_MACHINE\Software\WOW6432Node\Google\Enrollment" /f

REM Delete the specific registry value for cloud management enrollment token
reg delete "HKEY_LOCAL_MACHINE\Software\WOW6432Node\Google\Update\ClientState\{430FD4D0-B729-4F61-AA34-91526481799D}" /v CloudManagementEnrollmentToken /f

REM Delete the directory where Google Update writes cached cloud policies
rd /s /q "%ProgramFiles(x86)%\Google\Policies"

REM Optional: Prompt user to restart Chrome for the changes to take effect
echo Chrome policies removed. Please restart Chrome.
pause
