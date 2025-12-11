;# Varování: Tento soubor je spravován vývojovým prostredím Mosaic.
;# Nedoporucuje se upravovat ho rucne!

#program APP , V2.0.1.1
;**************************************
#libname "_NH", 20251213
;<ActionName/>
;<Programmer/>
;<FirmName/>
;<Copyright/>
;**************************************
;<History>
;</History>
;**************************************
#useoption CPM = 11             ; Typ CPM: I
#useoption AlarmTime = 200      ; první výstraha [ms]
#useoption MaxCycleTime = 1200  ; maximální cyklus [ms]
#useoption MinCycleTime = 0     ; minimální cyklus [ms]
#useoption RestartOnError = 1   ; 1 minutu po tvrdé chybe bude PLC restartován

#uselib "LocalLib\StdLib_V22_20180619.mlb"
#uselib "LocalLib\SysLib_V52_20241212.mlb"
#uselib "LocalLib\ToStringLib_V13_20110203.mlb"
#uselib "LocalLib\FileLib_V35_20250701.mlb"
#uselib "LocalLib\DataBoxLib_V18_20250410.mlb"
#uselib "LocalLib\CrcLib_V14_20250128.mlb"
#uselib "LocalLib\CanvasLib_V23_20190122.mlb"
#uselib "LocalLib\RamBoxLib_V11_20250116.mlb"
#uselib "LocalLib\ConvertLib_V26_20240105.mlb"
#uselib "LocalLib\TimeLib_V17_20251106.mlb"
#uselib "LocalLib\DaliLibEx_V13_20230602.mlb"
#uselib "LocalLib\ComLib_V42_20251016.mlb"
#uselib "LocalLib\EncryptLib_V14_20231018.mlb"
#uselib "LocalLib\InternetLib_V70_20241220.mlb"
#uselib "LocalLib\NotifyLib_V10_20190723.mlb"
#endlibs

;**************************************
#usefile "PanelMaker\DeklarPT.mos", 'auto'
#usefile "IOConfigurator\CONFIG.ST", 'auto'
#usefile "IOConfigurator\CONFIG.HWC", 'auto'
#usefile "PanelMaker\r0_p0_CP_2000.mos", 'auto'
#usefile "APP.ST"
#usefile "_Nh_01_SYS.st", 'lib'
#usefile "_Nh_02_TYP.st", 'lib'
#usefile "_Nh_03_CFG.st", 'lib'
#usefile "_Nh_04_GLB.st", 'lib'
#usefile "_Nh_05_SYS_WEB.st", 'lib'
#usefile "_Nh_06_LOG.st", 'lib'
#usefile "_Nh_07_FRM.st"
#usefile "_Nh_08_NOTIFY.st", 'lib'
#usefile "_Nh_09_Het.st", 'lib'
#usefile "_Nh_10_DALI.st", 'lib'
#usefile "_Nh_11_WRK.st", 'lib'
#usefile "_Nh_12_IMP_CFG.st", 'lib'
#usefile "_Nh_13_Web_LIB.st", 'lib'
#usefile "_Nh_14_Web_SHW.st", 'lib'
#usefile "_Nh_15_Frm_LIB.st", 'lib'
#usefile "_Nh_16_Frm_BRW.st", 'lib'
#usefile "_Nh_17_Frm_SCR.st", 'lib'
#usefile "_Nh_18_Frm_HOM.st", 'lib'
#usefile "_Nh_19_Web_HOM.st", 'lib'
#usefile "_Nh_20_Web_BRW.st", 'lib'
#usefile "_Nh_21_MNU.st", 'lib'
#usefile "_Nh_22_DEV.st", 'lib'
#usefile "_Nh_23_WEB.st", 'lib'
#usefile "_Nh_24_Ini.st", 'lib'
#usefile "_Nh_25_UTIL.st", 'lib'
#usefile "cust.st"
#usefile "prgMain.ST"
#usefile "APP.mcf", 'auto'
