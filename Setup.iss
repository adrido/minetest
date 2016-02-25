; Script generated by the Inno Script Studio Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Minetest"
#define MyAppVersion "0.4.13"
#define MyAppPublisher "Minetest comunity"
#define MyAppURL "http://www.minetest.net"
#define MyAppExeName "minetest.exe"

#define MinetestSourceDir ".\"

#define MinetestWin64BinDir "D:\Program Files\minetest\bin"#define MinetestWin32BinDir "D:\Program Files (x86)\minetest\bin"
#define MinetestGameDir "D:\Programme\minetest\games\minetest_game"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{5CAE583F-0E95-48C1-B544-043A8E8C142F}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputDir={#MinetestSourceDir}\bin
OutputBaseFilename=MinetestSetup
SetupIconFile={#MinetestSourceDir}\misc\minetest-icon.ico
Compression=lzma
SolidCompression=yes
ShowLanguageDialog=auto
UninstallDisplayIcon={app}\minetest.exe
ArchitecturesInstallIn64BitMode=x64
MinVersion=0,6.0sp2

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: "{#MinetestSourceDir}\README.txt"; DestDir: "{app}"; Flags: isreadme
Source: "{#MinetestWin64BinDir}\*"; DestDir: "{app}"; Flags: ignoreversion; Components: MinetestEngine; Check: IsWin64
Source: "{#MinetestWin32BinDir}\*"; DestDir: "{app}"; Flags: ignoreversion; Components: MinetestEngine; Check: not IsWin64
Source: "{#MinetestSourceDir}\builtin\*"; DestDir: "{app}\builtin\"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: MinetestEngine
Source: "{#MinetestSourceDir}\fonts\*"; DestDir: "{app}\fonts\"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: MinetestEngine
Source: "{#MinetestSourceDir}\textures\*"; DestDir: "{app}\textures\"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: MinetestEngine
Source: "{#MinetestSourceDir}\games\minimal\*"; DestDir: "{app}\games\minimal\"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: minimal
Source: "{#MinetestGameDir}\*"; DestDir: "{app}\games\minetest_game\"; Flags: ignoreversion createallsubdirs recursesubdirs; Components: MinetestGame

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Components]
Name: "MinetestEngine"; Description: "Minetest engine"; Types: compact custom full; Flags: fixed
Name: "minimal"; Description: "Minimal Development Test Game"
Name: "MinetestGame"; Description: "Minetest Game"; Types: full custom compact
