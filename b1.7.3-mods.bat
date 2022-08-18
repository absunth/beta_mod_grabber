@echo off

mkdir b1.7.3-mods
mkdir b1.7.3-mods\add-to-mods
mkdir b1.7.3-mods\add-to-minecraft

goto ask_optifine_version

:ask_optifine_version
echo what optifine version would you like to use?
echo 1 = OptiFine 1.7.3 HD AA G5 (newest, suggested)
echo 2 = OptiFine 1.7.3 HD MT G2 (fastest, buggy)
echo 3 = Optifine 1.7.3 HD S G (smooth)
echo 4 = Optifine 1.7.3 HD G (stable)
set /p optifine-version=select a version:

:check_optifine_version
if "%optifine-version%" == "1" goto download_optifine_1
if  "%optifine-version%" == "2" goto download_optifine_2
if "%optifine-version%" == "3" goto download_optifine_3
if "%optifine-version%" == "4" goto download_optifine_4
cls
echo invalid response
goto ask_optifine_version

:download_optifine_1
powershell -Command "(New-Object Net.WebClient).DownloadFile('http://optifine.net/download?f=beta_OptiFine_1.7.3_HD_AA_G5.zip', 'b1.7.3-mods/add-to-minecraft/optifine_hd_aa_g5.zip')"
goto optifine_exit

:download_optifine_2
powershell -Command "(New-Object Net.WebClient).DownloadFile('http://optifine.net/download?f=beta_OptiFine_1.7.3_HD_MT_G2.zip', 'b1.7.3-mods/add-to-minecraft/optifine_hd_mt_g2.zip')"
goto optifine_exit

:download_optifine_3
powershell -Command "(New-Object Net.WebClient).DownloadFile('http://optifine.net/download?f=beta_OptiFine_1.7.3_HD_S_G.zip', 'b1.7.3-mods/add-to-minecraft/optifine_hd_s_g.zip')"
goto optifine_exit

:download_optifine_4
powershell -Command "(New-Object Net.WebClient).DownloadFile('http://optifine.net/download?f=beta_OptiFine_1.7.3_HD_G.zip', 'b1.7.3-mods/add-to-minecraft/optifine_hd_g.zip')"
goto optifine_exit

:download_minimap
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://b2.mcarchive.net/file/mcarchive/f6869ff3e276d4083d5217c8d1d573bcad22b68d69b30bba7e871721650ebe08/%%5B1.7.3%%5DReiMinimap_v1.8.zip', 'b1.7.3-mods/add-to-mods/reis_minimap_1.8.zip')"
goto exit_minimap

:download_hmi
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/rekadoodle/HowManyItems/releases/download/v4.2/b1.7.3.HowManyItems.v4.2.0.zip', 'b1.7.3-mods/add-to-mods/how_many_items_4.2.0.zip')"
goto exit_hmi

:download_bitdepthfix
cls
echo downloading bitdepthfix
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://b2.mcarchive.net/file/mcarchive/3E06992B9A0A91A8354AB8A0298C0DB2B1A075343EE177C063F7B4888F9F903A/BitDepthFix%%201.7.3%%20.zip', 'b1.7.3-mods/add-to-minecraft/bitdepthfix.zip')"
goto bitdepthfix_exit

:optifine_exit
cls
echo downloading qol mods
powershell -Command "(New-Object Net.WebClient).DownloadFile('http://github.com/coffeenotfound/ModloaderFix-b1.7.3/releases/download/v1.0.0/ModLoader.Fix.b1.7.3-1.0.0.jar', 'b1.7.3-mods/add-to-minecraft/modloaderfix_1.0.0.jar')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/ShaRose/GuiAPI/raw/releases/GuiAPI0.11.0-1.7.zip', 'b1.7.3-mods/add-to-minecraft/guiapi_0.11.0-1.7.zip')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://download1979.mediafire.com/0yj75ka405hg/27g66a85jheck5d/Improved+Chat.2.4.7.zip', 'b1.7.3-mods/add-to-minecraft/improvedchat_2.4.7.zip')"
:: link above is from the original forum post https://www.minecraftforum.net/forums/mapping-and-modding-java-edition/minecraft-mods/1272371-1-2-3-wdmods-creepers-sneak-and-chat
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.com/rekadoodle/BetaTweaks/releases/download/v1.2/b1.7.3.BetaTweaks.v1.2.2.CLIENT.zip', 'b1.7.3-mods/add-to-mods/betatweaks_1.2.2.zip')"

wmic path Win32_VideoController get Name | find /I "amd"> nul && ( goto download_bitdepthfix)
:bitdepthfix_exit
cls
echo would you like to download rei's minimap?
echo 1 = yes, 2 = no
set /p minimap-value=select a option:

:check_minimap_value
if "%minimap-value%" == "1" goto download_minimap
if not "%minimap-value%" == "2" goto bitdepthfix_exit
:exit_minimap

cls
echo would you like to download how many items?
echo 1 = yes, 2 = no
set /p hmi-value=select a option:

:check_hmi_value
if "%hmi-value%" == "1" goto download_hmi
if not "%hmi-value%" == "2" goto exit_minimap
:exit_hmi

cls
echo finished
pause
