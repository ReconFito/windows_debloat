@echo off
call ".\utils\message.cmd" "[Remove] Default Windows Apps"
set listofbloatware=3DBuilder ^
Automate ^
Appconnector ^
Asphalt8Airborne ^
ActiproSoftwareLLC ^
AutodeskSketchBook ^
BingFoodAndDrink ^
BingHealthAndFitness ^
BingTravel ^
BingNews ^
bing ^
BubbleWitch3Saga ^
CyberLinkMediaSuiteEssentials ^
COOKINGFEVER ^
CaesarsSlotsFreeCasino ^
CandyCrushSaga ^
CommsPhone ^
ConnectivityStore ^
Clipchamp ^
CandyCrushSodaSaga ^
DisneyMagicKingdoms ^
Duolingo ^
DolbyAccess ^
DrawboardPDF ^
EclipseManager ^
FarmVille2CountryEscape ^
FitbitCoach ^
Flipboard ^
GetHelp ^
Getstarted ^
Hotspot ^
iHeartRadio ^
Keeper ^
LinkedInforWindows ^
Microsoft3DViewer ^
MicrosoftPowerBIForWindows ^
MicrosoftPowerBIForWindows ^
MixedReality.Portal ^
MarchofEmpires ^
MicrosoftOfficeHub ^
OneNote ^
Print3D ^
PicsArt-PhotoStudio ^
PolarrPhotoEditorAcademicEdition ^
Plex ^
PandoraMediaInc ^
PhototasticCollage ^
Prime ^
RoyalRevolt2 ^
ScreenSketch ^
Shazam ^
SkypeApp ^
Sketchable ^
Sway ^
Twitter ^
TuneInRadio ^
TikTok ^
ToDo ^
XboxApp ^
WindowsFeedbackHub ^
WindowsReadingList ^
Wunderlist ^
WinZipUniversal ^
WindowsPhone ^
windowscommunicationsapps ^
WindowsMaps ^
XING ^
YourPhone

(for %%a in (%listofbloatware%) do (
   powerShell -NoProfile -Command "Get-AppxPackage -allusers *%%a* | Remove-AppxPackage" ))