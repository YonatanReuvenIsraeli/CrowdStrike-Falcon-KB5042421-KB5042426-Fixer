@echo off
title CrowdStrike Falcon KB5042421/KB5042426 Fixer
setlocal
echo Program Name: CrowdStrike Falcon KB5042421/KB5042426 Fixer
echo Version: 3.0.12
echo License: GNU General Public License v3.0
echo Developer: @YonatanReuvenIsraeli
echo GitHub: https://github.com/YonatanReuvenIsraeli
echo Sponsor: https://github.com/sponsors/YonatanReuvenIsraeli
"%windir%\System32\net.exe" user > nul 2>&1
if "%errorlevel%"=="0" goto "NotInWindowsPreinstallationEnvironmentWindowsRecoveryEnvironment"
goto "DiskPartSet"

:"NotInWindowsPreinstallationEnvironmentWindowsRecoveryEnvironment"
echo.
echo You are not in Windows Preinstallation Environment or Windows Recovery Environment! You must run this batch file in Windows Preinstallation Environment or Windows Recovery Environment. Press any key to close this batch file.
pause > nul 2>&1
goto "Close"

:"DiskPartSet"
set DiskPart=
goto "Volume"

:"Volume"
if exist "diskpart.txt" goto "DiskPartExistVolume"
echo.
echo Listing volumes attached to this PC.
(echo list vol) > "diskpart.txt"
(echo exit) >> "diskpart.txt"
"%windir%\System32\diskpart.exe" /s "diskpart.txt" 2>&1
if not "%errorlevel%"=="0" goto "VolumeError"
del "diskpart.txt" /f /q > nul 2>&1
echo Volumes attached to this PC listed.
goto "WindowsAsk1"

:"DiskPartExistVolume"
set DiskPart=True
echo.
echo Please temporarily rename to something else or temporarily move to another location "diskpart.txt" in order for this batch file to proceed. "diskpart.txt" is not a system file. "diskpart.txt" is located in the folder "%cd%". Press any key to continue when "diskpart.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "Volume"

:"VolumeError"
del "diskpart.txt" /f /q > nul 2>&1
echo.
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "Volume"

:"WindowsAsk1"
echo.
set WindowsVolume=
set /p WindowsVolume="What volume is the Windows volume? (0-?) "
goto "SureWindowsAsk1"

:"SureWindowsAsk1"
echo.
set SureWindowsAsk1=
set /p SureWindowsAsk1="Are you sure volume %WindowsVolume% is the Windows volume? (Yes/No) "
if /i "%SureWindowsAsk1%"=="Yes" goto "WindowsAsk2"
if /i "%SureWindowsAsk1%"=="No" goto "Volume"
echo Invalid syntax!
goto "SureWindowsAsk1"

:"WindowsAsk2"
echo.
set WindowsAsk=
set /p WindowsAsk="Is the Windows volume %WindowsVolume% already assigned a drive letter? (Yes/No) "
if /i "%WindowsAsk%"=="Yes" goto "SureWindowsAsk2"
if /i "%WindowsAsk%"=="No" goto "WindowsDriveLetter"
echo Invalid syntax!
goto "WindowsAsk2"

:"SureWindowsAsk2"
echo.
set SureWindowsAsk2=
set /p SureWindowsAsk2="Are you sure Windows volume %WindowsVolume% is already assigned a drive letter? (Yes/No) "
if /i "%SureWindowsAsk2%"=="Yes" goto "DriveLetterWindows"
if /i "%SureWindowsAsk2%"=="No" goto "WindowsAsk2"
echo Invalid syntax!
goto "SureWindowsAsk2"

:"WindowsDriveLetter"
echo.
echo Finding an available drive letter.
if not exist "A:" set WindowsDriveLetter=A:
if not exist "A:" goto "AvailableDriveLetterFound"
if not exist "B:" set WindowsDriveLetter=B:
if not exist "B:" goto "AvailableDriveLetterFound"
if not exist "C:" set WindowsDriveLetter=C:
if not exist "C:" goto "AvailableDriveLetterFound"
if not exist "D:" set WindowsDriveLetter=D:
if not exist "D:" goto "AvailableDriveLetterFound"
if not exist "E:" set WindowsDriveLetter=E:
if not exist "E:" goto "AvailableDriveLetterFound"
if not exist "F:" set WindowsDriveLetter=F:
if not exist "F:" goto "AvailableDriveLetterFound"
if not exist "G:" set WindowsDriveLetter=G:
if not exist "G:" goto "AvailableDriveLetterFound"
if not exist "H:" set WindowsDriveLetter=H:
if not exist "H:" goto "AvailableDriveLetterFound"
if not exist "I:" set WindowsDriveLetter=I:
if not exist "I:" goto "AvailableDriveLetterFound"
if not exist "J:" set WindowsDriveLetter=J:
if not exist "J:" goto "AvailableDriveLetterFound"
if not exist "K:" set WindowsDriveLetter=K:
if not exist "K:" goto "AvailableDriveLetterFound"
if not exist "L:" set WindowsDriveLetter=L:
if not exist "L:" goto "AvailableDriveLetterFound"
if not exist "M:" set WindowsDriveLetter=M:
if not exist "M:" goto "AvailableDriveLetterFound"
if not exist "N:" set WindowsDriveLetter=N:
if not exist "N:" goto "AvailableDriveLetterFound"
if not exist "O:" set WindowsDriveLetter=O:
if not exist "O:" goto "AvailableDriveLetterFound"
if not exist "P:" set WindowsDriveLetter=P:
if not exist "P:" goto "AvailableDriveLetterFound"
if not exist "Q:" set WindowsDriveLetter=Q:
if not exist "Q:" goto "AvailableDriveLetterFound"
if not exist "R:" set WindowsDriveLetter=R:
if not exist "R:" goto "AvailableDriveLetterFound"
if not exist "S:" set WindowsDriveLetter=S:
if not exist "S:" goto "AvailableDriveLetterFound"
if not exist "T:" set WindowsDriveLetter=T:
if not exist "T:" goto "AvailableDriveLetterFound"
if not exist "U:" set WindowsDriveLetter=U:
if not exist "U:" goto "AvailableDriveLetterFound"
if not exist "V:" set WindowsDriveLetter=V:
if not exist "V:" goto "AvailableDriveLetterFound"
if not exist "W:" set WindowsDriveLetter=W:
if not exist "W:" goto "AvailableDriveLetterFound"
if not exist "X:" set WindowsDriveLetter=X:
if not exist "X:" goto "AvailableDriveLetterFound"
if not exist "Y:" set WindowsDriveLetter=Y:
if not exist "Y:" goto "AvailableDriveLetterFound"
if not exist "Z:" set WindowsDriveLetter=Z:
if not exist "Z:" goto "AvailableDriveLetterFound"
echo No drive letter is available! Please unmount 1 drive and then press any key to try again.
pause > nul 2>&1
goto "WindowsDriveLetter"

:"AvailableDriveLetterFound"
echo Available drive letter found.
goto "AssignDriveLetterWindows"

:"AssignDriveLetterWindows"
if exist "diskpart.txt" goto "DiskPartExistAssignDriveLetterWindows"
echo.
echo Assigning Windows volume %WindowsVolume% drive letter "%WindowsDriveLetter%".
(echo automount scrub) >
(echo sel vol %WindowsVolume%) >> "diskpart.txt"
(echo assign letter=%WindowsDriveLetter%) >> "diskpart.txt"
(echo exit) >> "diskpart.txt"
"%windir%\System32\diskpart.exe" /s "diskpart.txt" > nul 2>&1
if not "%errorlevel%"=="0" goto "AssignDriveLetterWindowsError"
del "diskpart.txt" /f /q > nul 2>&1
echo Assigned Windows volume %WindowsVolume% drive letter "%WindowsDriveLetter%".
set DriveLetterWindows=%WindowsDriveLetter%
goto "CheckExistWindowsAssign

:"DiskPartExistAssignDriveLetterWindows"
set DiskPart=True
echo.
echo Please temporarily rename to something else or temporarily move to another location "diskpart.txt" in order for this batch file to proceed. "diskpart.txt" is not a system file. "diskpart.txt" is located in the folder "%cd%". Press any key to continue when "diskpart.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "AssignDriveLetterWindows"

:"AssignDriveLetterWindowsError"
del "diskpart.txt" /f /q > nul 2>&1
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "WindowsDriveLetterExist"

:"CheckExistWindowsAssign"
if not exist "%DriveLetterWindows%\Windows" goto "NotWindowsAssign"
if /i "%DiskPart%"=="True" goto "DiskPartDone"
goto "CrowdStrikeCheck"

:"NotWindowsAssign"
if exist "diskpart.txt" goto "DiskPartExistNotWindowsAssign"
echo.
echo Windows not installed on volume %WindowsVolume%! Removing drive letter "%DriveLetterWindows%" from volume %WindowsVolume%.
(echo sel vol %WindowsVolume%) > "diskpart.txt"
(echo remove letter=%DriveLetterWindows%) >> "diskpart.txt"
(echo exit) >> "diskpart.txt"
"%windir%\System32\diskpart.exe" /s "diskpart.txt" > nul 2>&1
if not "%errorlevel%"=="0" goto "NotWindowsAssignError"
del "diskpart.txt" /f /q > nul 2>&1
echo Removed drive letter "%DriveLetterWindows%" from volume %WindowsVolume%. Please try again.
goto "Volume"

:"DiskPartExistNotWindowsAssign"
set DiskPart=True
echo Please temporarily rename to something else or temporarily move to another location "diskpart.txt" in order for this batch file to proceed. "diskpart.txt" is not a system file. "diskpart.txt" is located in the folder "%cd%". Press any key to continue when "diskpart.txt" is renamed to something else or moved to another location. This batch file will let you know when you can rename it back to its original name or move it back to its original location.
pause > nul 2>&1
goto "NotWindowsAssign"

:"NotWindowsAssignError"
del "diskpart.txt" /f /q > nul 2>&1
echo There has been an error! Press any key to try again.
pause > nul 2>&1
goto "NotWindowsAssign"

:"DiskPartDone"
echo.
echo You can now rename or move back the file back to "diskpart.txt". Press any key to continue.
pause > nul 2>&1
goto "CrowdStrikeCheck"

:"DriveLetterWindows"
echo.
set DriveLetterWindows=
set /p DriveLetterWindows="What is the drive letter that Windows is installed on? (A:-Z:) "
if /i "%DriveLetterWindows%"=="A:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="B:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="C:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="D:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="E:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="F:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="G:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="H:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="I:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="J:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="K:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="L:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="M:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="N:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="O:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="P:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="Q:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="R:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="S:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="T:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="U:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="V:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="W:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="X:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="Y:" goto "SureDriveLetterWindows"
if /i "%DriveLetterWindows%"=="Z:" goto "SureDriveLetterWindows"
echo Invalid syntax!
goto "DriveLetterWindows"

:"SureDriveLetterWindows"
echo.
set SureDriveLetterWindows=
set /p SureDriveLetterWindows="Are you sure "%DriveLetterWindows%" is the drive letter that Windows is installed on? (Yes/No) "
if /i "%SureDriveLetterWindows%"=="Yes" goto "CheckExistDriveLetterWindows"
if /i "%SureDriveLetterWindows%"=="No" goto "DriveLetterWindows"
echo Invalid syntax!
goto "SureDriveLetterWindows"

:"CheckExistDriveLetterWindows"
if not exist "%DriveLetterWindows%" goto "DriveLetterWindowsNotExist"
if not exist "%DriveLetterWindows%\Windows" goto "NotWindows"
goto "CrowdStrikeCheck"

:"DriveLetterWindowsNotExist"
echo "%DriveLetterWindows%" does not exist! Please try again.
goto "Volume"

:"NotWindows"
echo Windows not installed on "%DriveLetterWindows%"!
goto "Volume"

:"CrowdStrikeCheck"
echo.
echo Checking CrowdStrike Falcon status on Windows installation "%DriveLetterWindows%".
if exist "%DriveLetterWindows%\Windows\System32\drivers\CrowdStrike" goto "BugCheck"
echo CrowdStrike Falcon not installed on Windows installation "%DriveLetterWindows%"! Press any key to close this batch file.
pause > nul 2>&1
goto "Close"

:"BugCheck"
if exist "%DriveLetterWindows%\Windows\System32\drivers\CrowdStrike\C-00000291*.sys" goto "CrowdStrike"
echo CrowdStrike Falcon installed on Windows installation "%DriveLetterWindows%" but no problems found! Press any key to close this batch file.
pause > nul 2>&1
goto "Close"

:CrowdStrike
echo CrowdStrike Falcon installed on Windows installation "%DriveLetterWindows%" and may have problems!
set CrowdStrike=
set /p CrowdStrike="Did this PC BSOD on boot? (Yes/No) "
if /i "%CrowdStrike%"=="Yes" goto "Fix"
if /i "%CrowdStrike%"=="No" goto "Close"

:"Fix"
echo.
echo Fixing CrowdStrike Falcon.
del "%DriveLetterWindows%\Windows\System32\Drivers\C-00000291*.sys" /f /q > nul 2>&1
if not "%errorlevel%"=="0" goto "Error"
endlocal
echo CrowdStrike Falcon fixed! Please save everything you want before restarting this PC! Press any key to restart this PC.
pause > nul 2>&1
"%windir%\System32\wpeutil.exe" Reboot
exit

:"Error"
echo There has been an error! You can try again.
goto "CrowdStrike"

:"Close"
endlocal
exit
