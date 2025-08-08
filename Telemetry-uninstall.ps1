
# RUN AS ADMINISTRATOR



############################

# remove Telemetry in Task Scheduler
Remove-Item "$ENV:WINDIR\System32\Tasks\Microsoft\Windows\Application Experience" -Recurse -Force
Remove-Item "$ENV:WINDIR\System32\Tasks\Microsoft\Windows\Customer Experience Improvement Program" -Recurse -Force


Set-Service DiagTrack -StartupType Disabled
Set-Service diagnosticshub.standardcollector.service -StartupType Disabled

Set-Service DPS -StartupType Disabled
Set-Service WdiServiceHost -StartupType Disabled
Set-Service WdiSystemHost -StartupType Disabled
Set-Service DialogBlockingService -StartupType Disabled



Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'AllowTelemetry' -Type 'DWORD' -Value 0
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name 'AllowTelemetry' -Type 'DWORD' -Value 0
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection' -Name 'MaxTelemetryAllowed' -Type 'DWORD' -Value 0



############################
# disable Program Compatibility Assistant Service
Set-Service PcaSvc -StartupType Disabled


############################

# disable windows update
#Set-Service wuauserv -StartupType Disabled
#Remove-Item "$ENV:WINDIR\System32\Tasks\Microsoft\Windows\WindowsUpdate" -Recurse -Force


# disable windows error reporting
Set-Service wersvc -StartupType Disabled



############################

# show file extension
#Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -Type 'DWORD' -Value 0


############################

# show .lnk extensions
#Remove-ItemProperty -Path 'Registry::HKEY_CLASSES_ROOT\lnkfile' -Name 'NeverShowExt'
#Set-ItemProperty -Path 'Registry::HKEY_CLASSES_ROOT\lnkfile' -Name 'NeverShowExt OLD' -Type 'String' -Value ''



############################

Stop-Process -Name 'explorer' -Force







