; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Converter "
#define MyAppVersion "1.0"
#define MyAppPublisher "Danish Khan"
#define MyAppExeName "Converter.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{8EA6822A-A43C-45CB-89C3-D245A4388B8C}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName=C:\{#MyAppName}
DisableProgramGroupPage=yes
OutputDir=C:\Users\404192\Desktop
OutputBaseFilename=Converter
SetupIconFile=C:\Users\404192\Desktop\Audio Converter\Converter.ico
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"
Name: "catalan"; MessagesFile: "compiler:Languages\Catalan.isl"
Name: "corsican"; MessagesFile: "compiler:Languages\Corsican.isl"
Name: "czech"; MessagesFile: "compiler:Languages\Czech.isl"
Name: "danish"; MessagesFile: "compiler:Languages\Danish.isl"
Name: "dutch"; MessagesFile: "compiler:Languages\Dutch.isl"
Name: "finnish"; MessagesFile: "compiler:Languages\Finnish.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"
Name: "greek"; MessagesFile: "compiler:Languages\Greek.isl"
Name: "hebrew"; MessagesFile: "compiler:Languages\Hebrew.isl"
Name: "hungarian"; MessagesFile: "compiler:Languages\Hungarian.isl"
Name: "italian"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "norwegian"; MessagesFile: "compiler:Languages\Norwegian.isl"
Name: "polish"; MessagesFile: "compiler:Languages\Polish.isl"
Name: "portuguese"; MessagesFile: "compiler:Languages\Portuguese.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "scottishgaelic"; MessagesFile: "compiler:Languages\ScottishGaelic.isl"
Name: "serbiancyrillic"; MessagesFile: "compiler:Languages\SerbianCyrillic.isl"
Name: "serbianlatin"; MessagesFile: "compiler:Languages\SerbianLatin.isl"
Name: "slovenian"; MessagesFile: "compiler:Languages\Slovenian.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "turkish"; MessagesFile: "compiler:Languages\Turkish.isl"
Name: "ukrainian"; MessagesFile: "compiler:Languages\Ukrainian.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Users\404192\Desktop\Audio Converter\dist\Converter.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\404192\Desktop\Audio Converter\dist\tcl\*"; DestDir: "{app}\tcl"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\Users\404192\Desktop\Audio Converter\dist\_bz2.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\404192\Desktop\Audio Converter\dist\_ctypes.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\404192\Desktop\Audio Converter\dist\_hashlib.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\404192\Desktop\Audio Converter\dist\_lzma.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\404192\Desktop\Audio Converter\dist\_socket.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\404192\Desktop\Audio Converter\dist\_ssl.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\404192\Desktop\Audio Converter\dist\_tkinter.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\404192\Desktop\Audio Converter\dist\_win32sysloader.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\404192\Desktop\Audio Converter\dist\pyexpat.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\404192\Desktop\Audio Converter\dist\python34.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\404192\Desktop\Audio Converter\dist\pywintypes34.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\404192\Desktop\Audio Converter\dist\select.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\404192\Desktop\Audio Converter\dist\tcl86t.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\404192\Desktop\Audio Converter\dist\tk86t.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\404192\Desktop\Audio Converter\dist\unicodedata.pyd"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\404192\Desktop\Audio Converter\dist\win32api.pyd"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

