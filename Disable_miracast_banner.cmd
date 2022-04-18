@echo off
ICACLS "C:\Windows\System32\Windows.Internal.PlatformExtension.MiracastBannerExperience.dll" /grant "%username%":F
REN "C:\Windows\System32\Windows.Internal.PlatformExtension.MiracastBannerExperience.dll" "Windows.Internal.PlatformExtension.MiracastBannerExperience.dll.old"

@pause