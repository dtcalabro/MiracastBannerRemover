@echo off
ICACLS "C:\Windows\System32\Windows.Internal.PlatformExtension.MiracastBannerExperience.dll.old" /grant "%username%":F
REN "C:\Windows\System32\Windows.Internal.PlatformExtension.MiracastBannerExperience.dll.old" "Windows.Internal.PlatformExtension.MiracastBannerExperience.dll"

@pause