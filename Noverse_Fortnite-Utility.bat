@echo off
SETLOCAL EnableExtensions EnableDelayedExpansion

title Noverse Fortnite Settings Configuration Utility

set "SettingsPath=%LOCALAPPDATA%\FortniteGame\Saved\Config\WindowsClient\GameUserSettings.ini"
del "%LOCALAPPDATA%\FortniteGame\Saved\Config\WindowsClient\NoverseBackup.ini" 2>nul
set "BackupPath=%LOCALAPPDATA%\FortniteGame\Saved\Config\WindowsClient\NoverseBackup.ini"

cls
echo.
echo      ::::    :::       ::::::::       :::     :::      ::::::::::      :::::::::        ::::::::       :::::::::: 
echo      :+:+:   :+:      :+:    :+:      :+:     :+:      :+:             :+:    :+:      :+:    :+:      :+:        
echo      :+:+:+  +:+      +:+    +:+      +:+     +:+      +:+             +:+    +:+      +:+             +:+        
echo      +#+ +:+ +#+      +#+    +:+      +#+     +:+      +#++:++#        +#++:++#:       +#++:++#++      +#++:++#   
echo      +#+  +#+#+#      +#+    +#+       +#+   +#+       +#+             +#+    +#+             +#+      +#+        
echo      #+#   #+#+#      #+#    #+#        #+#+#+#        #+#             #+#    #+#      #+#    #+#      #+#        
echo      ###    ####       ########           ###          ##########      ###    ###       ########       ##########
echo. 
echo                                    Fortnite Game Settings Configuration Utility
echo ________________________________________________________________________________________________________________________
echo.

if exist "%SettingsPath%" (
    attrib -r "%SettingsPath%"
    copy "%SettingsPath%" "%BackupPath%" >nul
    echo Backup created at: "%BackupPath%"
) else (
    echo No existing settings file found. A new one will be created.
)

for /f "tokens=2 delims==" %%a in ('findstr /c:"NamedCounts=" "%BackupPath%"') do (
    set "NamedCounts=%%a"
)

echo.

:input_resolution
echo Please enter your preferred resolution width (e.g., 1920):
set /p ResolutionX="X: "
if "!ResolutionX!"=="" (
    echo Input cannot be empty, please try again.
    goto input_resolution
)

echo.

:input_height
echo Please enter your preferred resolution height (e.g., 1080):
set /p ResolutionY="Y: "
if "!ResolutionY!"=="" (
    echo Input cannot be empty, please try again.
    goto input_height
)

echo.

:input_framerate
echo Please enter your preferred frame rate limit (e.g., 240.00):
set /p FrameRateLimit="FPS Cap: "
if "!FrameRateLimit!"=="" (
    echo Input cannot be empty, please try again.
    goto input_framerate
)


(
echo [/Script/FortniteGame.FortGameUserSettings]
echo FullscreenMode=0
echo bMotionBlur=False
echo bShowGrass=False
echo bShowFPS=True
echo LatencyTweak2=2
echo FortAntiAliasingMethod=Disabled
echo InitialBenchmarkState=1
echo SocialImportOptedOutVersion=1
echo TemporalSuperResolutionQuality=Custom
echo DLSSQuality=0
echo DesiredGlobalIlluminationQuality=0
echo DesiredReflectionQuality=0
echo PreNaniteGlobalIlluminationQuality=0
echo PreNaniteReflectionQuality=0
echo bRayTracing=False 
echo bIsEnergySavingEnabledIdle=False
echo bIsEnergySavingEnabledFocusLoss=False 
echo DisplayGamma=2.510000
echo bDisableMouseAcceleration=True 
echo bHasSeenFriendImportToast=True
echo bUseVSync=False
echo LastConfirmedFullscreenMode=0
echo PreferredFullscreenMode=0
echo ResolutionSizeX=%ResolutionX%
echo ResolutionSizeY=%ResolutionY%
echo LastUserConfirmedResolutionSizeX=%ResolutionX%
echo LastUserConfirmedResolutionSizeY=%ResolutionY%
echo DesiredScreenWidth=%ResolutionX%
echo DesiredScreenHeight=%ResolutionY%
echo LastUserConfirmedDesiredScreenWidth=%ResolutionX%
echo LastUserConfirmedDesiredScreenHeight=%ResolutionY%
echo AudioQualityLevel=1
echo FrameRateLimit=%FrameRateLimit%
echo NamedTimes=()
echo NamedCounts=%NamedCounts%
echo [RayTracing] 
echo r.RayTracing.EnableInGame=False
echo [ScalabilityGroups]
echo sg.ResolutionQuality=99.990000
echo sg.ViewDistanceQuality=0
echo sg.AntiAliasingQuality=0
echo sg.ShadowQuality=0
echo sg.GlobalIlluminationQuality=0
echo sg.ReflectionQuality=0
echo sg.PostProcessQuality=0
echo sg.TextureQuality=0
echo sg.EffectsQuality=0
echo sg.FoliageQuality=0
echo sg.ShadingQuality=0
echo [D3DRHIPreference]
echo PreferredRHI=dx11
echo PreferredFeatureLevel=es31
) > "%SettingsPath%"

attrib +r "%SettingsPath%"

cls
echo.
echo      ::::    :::       ::::::::       :::     :::      ::::::::::      :::::::::        ::::::::       :::::::::: 
echo      :+:+:   :+:      :+:    :+:      :+:     :+:      :+:             :+:    :+:      :+:    :+:      :+:        
echo      :+:+:+  +:+      +:+    +:+      +:+     +:+      +:+             +:+    +:+      +:+             +:+        
echo      +#+ +:+ +#+      +#+    +:+      +#+     +:+      +#++:++#        +#++:++#:       +#++:++#++      +#++:++#   
echo      +#+  +#+#+#      +#+    +#+       +#+   +#+       +#+             +#+    +#+             +#+      +#+        
echo      #+#   #+#+#      #+#    #+#        #+#+#+#        #+#             #+#    #+#      #+#    #+#      #+#        
echo      ###    ####       ########           ###          ##########      ###    ###       ########       ##########
echo. 
echo                                    Fortnite Game Settings Configuration Utility
echo ________________________________________________________________________________________________________________________
echo.
echo Configuration complete, settings have been successfully updated.
echo Confirmed settings: Resolution %ResolutionX%x%ResolutionY% at %FrameRateLimit% FPS
echo.
echo Thank you for using the Noverse Fortnite Settings Configuration Utility.
echo For support, join us on Discord: https://discord.gg/E2ybG4j9jU
echo.
echo Press any key to exit the script...
pause > nul

ENDLOCAL