for /F "tokens=1-3 delims=/" %%A in ('echo %date%') do ( set ymd=%%A-%%B-%%C
)
for /F "tokens=1-2 delims=:" %%a in ('time /t') do ( set ymd=%ymd%_%%ah_%%bmin )
rem pastabackuptmpsys
rem stringbancosys
rem pastabackupfinalsys
rem pastarelatoriossys

set pastabackuptmpsys=E:\Projetos\Agil Solucoes em Softwares\SGE\_diversos\Backups_Automatico
set stringbancosys=localhost:GM_VAZIO
set pastabackupfinalsys=E:\Projetos\Agil Solucoes em Softwares\SGE\_diversos\Backups_Automatico\Bkp
set pastarelatoriossys=E:\Projetos\Agil Solucoes em Softwares\SGE\_diversos\Backups_Automatico\Log
set pastafirebird=C:\Program Files (x86)\Firebird\Firebird_2_1\bin
set pastazip7=C:\Program Files\7-Zip

del "%pastabackuptmpsys%\GA_%ymd%.fbk"
del "%pastabackuptmpsys%\GA_%ymd%.log"
del "%pastabackuptmpsys%\GA_%ymd%.7z"

"%pastafirebird%\gbak.exe" -b -z -v "%stringbancosys%" "%pastabackuptmpsys%\GA_%ymd%.fbk" -Y "%pastabackuptmpsys%\GA_%ymd%.log" -user SYSDBA -password masterkey

"%pastazip7%\7z.exe" a -t7z -mx=9 -r "%pastabackuptmpsys%\GA_%ymd%.7z" "%pastabackuptmpsys%\GA_%ymd%.*" "%pastarelatoriossys%"

copy "%pastabackuptmpsys%\GA_%ymd%.log" "%pastarelatoriossys%"
copy "%pastabackuptmpsys%\GA_%ymd%.7z" "%pastabackupfinalsys%"

del "%pastabackuptmpsys%\GA_%ymd%.fbk"
del "%pastabackuptmpsys%\GA_%ymd%.log"
del "%pastabackuptmpsys%\GA_%ymd%.7z"
