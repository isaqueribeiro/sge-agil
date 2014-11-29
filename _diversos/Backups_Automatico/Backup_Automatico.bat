for /F "tokens=1-3 delims=/" %%A in ('echo %date%') do (set ymd=%%A-%%B-%%C)
for /F "tokens=1-2 delims=:" %%a in ('time /t') do (set ymd=%ymd%_%%ah_%%bmin)
rem pastabackuptmpsys
rem stringbancosys
rem nomearquivosys
rem pastabackupfinalsys
rem pastarelatoriossys
rem googledrivesys

set pastabackuptmpsys=E:\Projetos\Agil Solucoes em Softwares\SGE\_diversos\Backups_Automatico
set stringbancosys=localhost:DIMENSAO
set nomearquivosys=TESTE
set pastabackupfinalsys=E:\Projetos\Agil Solucoes em Softwares\SGE\_diversos\Backups_Automatico\Bkp
set pastarelatoriossys=E:\Projetos\Agil Solucoes em Softwares\SGE\_diversos\Backups_Automatico\Log
set pastafirebird=C:\Program Files (x86)\Firebird\Firebird_2_1\bin
set pastazip7=C:\Program Files\7-Zip
set googledrivesys=C:\Users\Isaque\Google Drive\_Backup%nomearquivosys%

del "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.fbk"
del "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.log"
del "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.7z"

del "%pastarelatoriossys%\%nomearquivosys%_*.*"

"%pastafirebird%\gbak.exe" -b -z -v "%stringbancosys%" "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.fbk" -Y "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.log" -user SYSDBA -password masterkey

"%pastazip7%\7z.exe" a -t7z -mx9 "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.7z" "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.*" "%pastarelatoriossys%"

copy "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.7z" "%pastabackupfinalsys%"
copy "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.log" "%pastarelatoriossys%"

copy "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.7z" "%googledrivesys%"

del "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.fbk"
del "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.log"
del "%pastabackuptmpsys%\%nomearquivosys%_%ymd%.7z"
