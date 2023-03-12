; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{5C82D346-BE09-4D61-93D2-7A3C3F9A8DDC}
AppName=SnapPy
AppVerName=SnapPy
AppPublisher=Marc Culler and Nathan Dunfield
AppPublisherURL=http://snappy.computop.org
AppSupportURL=http://snappy.computop.org
AppUpdatesURL=http://snappy.compytop.org
DefaultDirName={pf}\SnapPy
DefaultGroupName=SnapPy
AllowNoIcons=yes
OutputDir=.
OutputBaseFilename=InstallSnapPy-Dbg
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "dist\SnapPy_debug\SnapPy.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "dist\SnapPy_debug\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\SnapPy"; Filename: "{app}\SnapPy.exe"; IconFileName: "{app}\snappy\SnapPy.ico"
Name: "{group}\{cm:UninstallProgram,SnapPy}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\SnapPy"; Filename: "{app}\SnapPy.exe"; Tasks: desktopicon; IconFileName: "{app}\snappy\SnapPy.ico"

[Run]
Filename: "{app}\SnapPy.exe"; Description: "{cm:LaunchProgram,SnapPy}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: filesandordirs; Name: "{app}\snappy"
Type: filesandordirs; Name: "C:\Users\{username}\AppData\local\VirtualStore\Program Files (x86)\SnapPy"
Type: filesandordirs; Name: "C:\Users\{username}\AppData\local\VirtualStore\Program Files\SnapPy"

[InstallDelete]
Type: filesandordirs; Name: "C:\Users\{username}\AppData\local\VirtualStore\Program Files (x86)\SnapPy"
Type: filesandordirs; Name: "C:\Users\{username}\AppData\local\VirtualStore\Program Files\SnapPy"
