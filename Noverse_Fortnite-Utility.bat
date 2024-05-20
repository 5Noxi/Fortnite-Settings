@echo off
SETLOCAL EnableExtensions EnableDelayedExpansion

title Noverse Fortnite Settings Configuration Utility

echo.
echo      ::::    :::       ::::::::       :::     :::      ::::::::::      :::::::::        ::::::::       :::::::::: 
echo      :+:+:   :+:      :+:    :+:      :+:     :+:      :+:             :+:    :+:      :+:    :+:      :+:        
echo      :+:+:+  +:+      +:+             +:+     +:+      +:+             +:+    +:+      +:+             +:+        
echo      +#+ +:+ +#+      +#+    +:+      +#+     +:+      +#++:++#        +#++:++#:       +#++:++#++      +#++:++#   
echo      +#+  +#+#+#      +#+    +#+       +#+   +#+       +#+             +#+    +#+             +#+      +#+        
echo      #+#   #+#+#      #+#    #+#        #+#+#+#        #+#             #+#    #+#      #+#    #+#      #+#        
echo      ###    ####       ########           ###          ##########      ###    ###       ########       ##########
echo. 
echo                                    Fortnite Game Settings Configuration Utility
echo ________________________________________________________________________________________________________________________
echo.
echo.
echo                           This script is provided by NOVERSE. All rights reserved. !!
echo                Unauthorized copying of this software, via any medium, is strictly prohibited.
echo                                     Proprietary and confidential.
echo.
echo.
echo.
echo                                Press any key to continue with the script...
pause > nul
cls


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

echo.

set "NamedTimes="
for /f "delims=" %%a in ('type "%SettingsPath%" ^| find "NamedTimes="') do (
    set "NamedTimes=%%a"
)

set "NamedTimes=!NamedTimes:NamedTimes=!"
set "NamedTimes=!NamedTimes:(=(!"
set "NamedTimes=!NamedTimes:)=)!"

set "NamedCounts="
for /f "delims=" %%a in ('type "%SettingsPath%" ^| find "NamedCounts="') do (
    set "NamedCounts=%%a"
)

set "NamedCounts=!NamedCounts:NamedCounts=!"
set "NamedCounts=!NamedCounts:(=(!"
set "NamedCounts=!NamedCounts:)=)!"

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
echo [D3DRHIPreference]
echo PreferredRHI=dx11
echo PreferredFeatureLevel=es31
echo.
echo [/Script/FortniteGame.FortGameUserSettings]
echo FullscreenMode=0
echo CosmeticStreamingEnabled=CodeSet_Disabled
echo UnlockConsoleFPS=False
echo SubGameSelectCount_Athena=0
echo SubGameLastSelectedTime_Athena=0001.01.01-00.00.00
echo SubGameSelectCount_Campaign=0
echo SubGameLastSelectedTime_Campaign=0001.01.01-00.00.00 
echo LastTimeSettingsSnapshotUploaded=0001.01.01-00.00.00 
echo FirstLoginOnDevice=0001.01.01-00.00.00
echo SafeZone=1.000000
echo bIsSafeZoneSet=False
echo bMotionBlur=False
echo bShowGrass=False
echo bShowFPS=True
echo bUseGPUCrashDebugging=False
echo bStopRenderingInBackground=False
echo bLatencyTweak1=False
echo LatencyTweak2=2
echo bLatencyFlash=False
echo FortAntiAliasingMethod=Disabled
echo bEnableDLSSFrameGeneration=False
echo InitialBenchmarkState=0
echo SocialImportOptedOutVersion=0
echo TemporalSuperResolutionQuality=Disabled
echo DLSSQuality=0
echo bUseNanite=False
echo DesiredGlobalIlluminationQuality=0
echo DesiredReflectionQuality=0
echo PreNaniteGlobalIlluminationQuality=0
echo PreNaniteReflectionQuality=0
echo bRayTracing=False
echo bIsEnergySavingEnabledIdle=False
echo bIsEnergySavingEnabledFocusLoss=False
echo DisplayGamma=2.700000
echo UserInterfaceContrast=1.000000
echo bDisableMouseAcceleration=True
echo bHasSeenFriendImportToast=False
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
echo NamedTimes!NamedTimes!
echo NamedCounts!NamedCounts!
echo bShowActorsWithSeasonItemTagMapIndicators=False
echo bShowCareerTabBang=False
echo b120FpsMode=False
echo FrontendFrameRateLimit=120
echo EnergySavingLevelFocusLoss=1
echo bLockerHideUnsupportedItems=True
echo bHasSeenItemShop=True
echo bHasSeenJunoOutfitsFTUE=True
echo bIsJunoFTUEQuestTrackingEnabled=False
echo bHasSeenDonutShopSequence=True
echo LastSelectedFillOption=False
echo bHasSeenCreativePhoneTutorial=True
echo bHasSeenCreativeHeatmapTutorial=True
echo bHasSeenTapToShoot=True
echo bUseHeadphoneMode=False
echo bHasSeenErebusSocialImport=True
echo bAutoImportFriendEnabled=False
echo bMultiFactorAuthModalOpOut=False
echo LastEnableMFAModalPromptTime=0001.01.01-00.00.00
echo LastVKImportPromptTime=0001.01.01-00.00.00
echo LastAffiliateToastTime=0001.01.01-00.00.00
echo bSendAppsFlyerEventOnInstallation=False
echo bAllowFullGameDownload=False
echo bAllowCellularDownload=False
echo bAutoLaunchFullGame=False
echo bAllowDownloadHighResMips=False
echo bAllowLowPowerMode=False
echo bAllowVideoPlayback=False
echo bShowTemperature=False
echo LowInputLatencyModeIsEnabled=True
echo bNeedsToSeeFireModeSelectionReminder=False
echo bUseDynamicResolution=False
echo WindowPosX=-1
echo WindowPosY=-1
echo LastConfirmedAudioQualityLevel=1
echo bUseHDRDisplayOutput=False
echo HDRDisplayOutputNits=1000
echo.
echo [RayTracing]
echo r.RayTracing.EnableInGame=False
echo.
echo [ScalabilityGroups]
echo sg.ResolutionQuality=99.9899979
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
echo sg.LandscapeQuality=0
echo.
echo [ChatSettings]
echo HideSocialName=False
echo AutoImportFriends=False
echo ShowNotifications=False
echo NeverFadeMessages=False
echo ShowTimeStamps=False
echo ShowWhispersInAllTabs=False
echo ShowCustomTab=False
echo ShowWhispersTab=False
echo ShowGlobalTab=False
echo ShowCombatAndEventsTab=False
echo ShowClanTabs=False
echo HideOffline=False
echo HideOutgoing=False
echo HideSuggestions=True
echo HideRecent=False
echo HideBlocked=True
echo FilterMatureLanguage=False
echo DisplayCharacterNames=False
echo FriendInviteReceivedCueEnabled=False
echo GameOrPartyInviteReceivedCueEnabled=False
echo MessageReceivedCueEnabled=False
echo SoundEnabled=False
echo ShowTextChat=False
echo FontSize=1
echo WindowHeight=0
echo WindowOpacity=0.5
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