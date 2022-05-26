#Persistent
#NoTrayIcon
#SingleInstance Off
DetectHiddenWindows on
SetTitleMatchMode, 3
SetControlDelay -1

if not A_IsAdmin{
try {
Run *RunAs "%A_ScriptFullPath%"
ExitApp
}
catch e {
MsgBox, 48, MinMacro, Please run as administrator!
ExitApp
}
}

FileVersion = 1
try{
	getver := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	getver.Open("GET", "https://raw.githubusercontent.com/jollyjoee/minmacro/main/version")
	getver.Send()
	getver.WaitForResponse()
	urlversion := Trim(getver.ResponseText, "`n")

	If (FileVersion != urlversion)
	{
		MsgBox, 8244, MinMacro Update, A new Version is available!`n`nUpdate now?`n`nCurrent Version: v%FileVersion% | Latest Version: v%urlversion%
		IfMsgBox, Yes
		{
			Run, https://github.com/jollyjoee/minmacro/blob/main/MinMacro.exe?raw=true
		}
		IfMsgBox, No
		{
			Sleep, 500
			Goto, RunApplication
		}
}
Else
{
	goto, RunApplication
}
} catch e{
	MsgBox, 16, MinMacro, An error has occured in retrieving current file version.`nAuto-update may not work until this issue is resolved.`nPress "Ok" to ignore this message and continue to the script.
	Sleep, 500
	goto, RunApplication
}
Return
*/


RunApplication:


FileInstall, Multi Cabal AMPM.exe, %A_Temp%\Multi Cabal AMPM.exe, 1
FileInstall, Multi Cabal Asia.exe, %A_Temp%\Multi Cabal Asia.exe, 1
FileInstall, Multi Cabal Classic.exe, %A_Temp%\Multi Cabal Classic.exe, 1
FileInstall, Multi Cabal Emperor.exe, %A_Temp%\Multi Cabal Emperor.exe, 1
FileInstall, Multi Cabal EXT.exe, %A_Temp%\Multi Cabal EXT.exe, 1
FileInstall, Multi Cabal Greatway.exe, %A_Temp%\Multi Cabal Greatway.exe, 1
FileInstall, Multi Cabal Riot.exe, %A_Temp%\Multi Cabal Riot.exe, 1
FileInstall, Multi Cabal Venom.exe, %A_Temp%\Multi Cabal Venom.exe, 1
FileInstall, Multi Launcher COPH.exe, %A_Temp%\Multi Launcher COPH.exe, 1

terms = 
(
Facebook Page: www.facebook.com/minmacro

Terms and Conditions:
1. If a product is purchased by a customer, he/she will not be able to refund the payment after he/she receives his/her access.
-------------------------
1a. Refund will only be considered if the customer provides proof for the reason of refund. (i.e. Product not working, Product is bugged, Product does not provide its expected function)
-------------------------
1b. Refund will be given without contest if the developer does not resolve any of the issue/s stated in the examples in 1a within 14 days of said issue/s.


2. Transferring a product to a different person is not allowed.


3. Since our products now have a database system to verify a user's license, we no longer require the users to provide screenshots of their computer's information in order to verify.


4. Resellers are not going to be entertained.


5. Referral bonus system
-------------------------
5a. If he/she is a previous customer of any MinMacro product, he/she is entitled to a referral bonus system. Every time he/she refers a person to MinMacro and that said person purchases a product, The referee will receive a 20 Percent bonus from the product/s that the referred client purchases. 
-------------------------
5b. Referral sales will only be considered if the referred person mentions to the devs that "this" person referred them. (i.e. User 1 = referrer, User 2 = Referee. User 1 is only entitled to a referral bonus if user 2, upon purchasing a product, mentions that user 1 referred them)
)

bdmsteps = 
(
How to use BaldusMacro by MinMacro

1st: link a client to the MinMacro app in the "Home" Tab.
2nd: Select a client from the list on the Left.
3rd: Input the amount of time to kill Baldus (Add 10-15 seconds).
4th: Enter Baldus arena then exit immediately and dont move.
5th: Click "Start".

Settings for all Cabal clients/servers:
- Resolution:800x600
- Fixed UI Window: Unchecked
- Ui Size: 1
- Keybinds > Enemy Auto Retarget: MouseMiddle
- Buff Skills: Alt 1 & Alt 2
- Aura Skill: Alt 3

-------------------------

For Cabal Asia:
- Camera: Quarter view (No limit zoom out)
- 2 Frontier stones in the 1st and 2nd slots of inventory tab 1
- 1st slot: Baldus Frontier (x:54/y:18; Default)
- 2nd slot: Warp Gate Frontier (x:19/y:109; Default)
- Dash To Cursor : Unchecked
- Dash in Alt 4
)

mccoph = -1multicophclient
mcpvs = 0multipvsclient
Autowar = 1warautomacro
Baldus = 2macrobalduspvs
Premium = 3minpremmacro
Senimacro = 4macrosenilineacoph
Steamer = 5macrocophsteamerpremium

IniRead, pathcoph1, %A_Temp%\MinMacro Config.ini, COPHPath, COPH, Click "Install" and select Cabal's main folder.

Gui -Caption
Gui Font, s9, Segoe UI
Gui Add, Tab3, x0 y0 w391 h381, Home|Basic|Premium|SeniMacro|Steamer|AutoWar|Baldus
Gui, font

Gui Tab, Home
Gui Add, Button, x-1000 y-1000
Gui Add, Edit, x10 y50 w210 h170 +ReadOnly -WantCtrlA -WantTAb -WantReturn, %terms%
Gui Add, Text, x35 y230 w182 h20, Client Version: %FileVersion% | Server Version: %urlversion%
Gui Add, GroupBox, x230 y50 w150 h100 +Center, MultiClient for PVS
Gui Add, GroupBox, x230 y160 w150 h100 +Center, MultiClient for COPH 
Gui Add, GroupBox, x230 y270 w150 h70 +Center, MultiClient Activation
Gui Add, GroupBox, x10 y250 w210 h90 +Center, Link app to a Cabal client
Gui Add, Edit, x22 y275 w185 h20 vclientname hwndLink
EM_SETCUEBANNER(Link, "Set client name here then click 'set'")
Gui Add, Button, x21 y303 w90 h30 gset vset, Set
Gui Add, Button, x118 y303 w90 h30 grevert vrevert, Revert
Gui Add, Text, x3 y346 w500 h2 +0x10
Gui Add, Button, x320 y352 w61 h23 gclose, Close
Gui Add, Button, x250 y352 w61 h23 grestart, Restart 
Gui Add, Link, x10 y357, Visit our page: <a href="www.facebook.com/minmacro">www.facebook.com/minmacro</a>
Gui Add, Text, x240 y294 w32 h20, COPH:  
Gui Add, Button, x327 y289 w40 h22 gcopymccoph vcopymccoph, Copy
Gui Add, Text, x249 y319 w23 h15, PVS:  
Gui Add, Button, x327 y314 w40 h22 gcopymcpvs vcopymcpvs, Copy
Gosub, mcpvs
	If (mcpvsactive = 1){
		Gui Add, Edit, x274 y315 w50 h20 +ReadOnly, Active
		GuiControl, Disable, copymcpvs
		{
			Gui Add, DropDownList, x242 y75 w130 vpvslist, Cabal AMPM|Cabal Asia|Cabal Classic|Cabal Emperor|Cabal EXT|Cabal Greatway|Cabal Riot|Cabal Venom
			Gui Add, Button, x242 y110 w60 h30 ginstallpvs, Install
			Gui Add, Button, x310 y110 w60 h30 glaunchpvs vlaunchpvs, Launch
		}
	}
	Else If (mcpvsactive = 0){
		Gui Add, Edit, x274 y315 w50 h20 +ReadOnly, %mcpvsEncrypted%
		Gui Add, DropDownList, x242 y75 w130 vpvslist Disabled, Cabal AMPM|Cabal Asia|Cabal Classic|Cabal Emperor|Cabal EXT|Cabal Greatway|Cabal Riot
		Gui Add, Button, x242 y110 w60 h30 Disabled, Install
		Gui Add, Button, x310 y110 w60 h30 Disabled, Launch
	}
Gosub, mccoph
	If (mccophactive = 1){
		Gui Add, Edit, x274 y290 w50 h20 +ReadOnly, Active
		GuiControl, Disable, copymccoph
		{
			Gui Add, Edit, x242 y185 w130 h20 +ReadOnly vpath, %pathcoph1%
			Gui Add, Button, x242 y220 w60 h30 ginstallcoph, Install
			Gui Add, Button, x310 y220 w60 h30 glaunchcoph vlaunchcoph, Launch
		}
	}
	If Else (mccophactive = 0){
		Gui Add, Edit, x274 y290 w50 h20 +ReadOnly, %mccophEncrypted%
		{
			Gui Add, Edit, x240 y185 w130 h20 +ReadOnly Disabled vpath, %pathcoph1%
			Gui Add, Button, x242 y220 w60 h30 Disabled, Install
			Gui Add, Button, x310 y220 w60 h30 Disabled, Launch
		}
	}
Gui, Font

Gui Tab, AutoWar
Gui Add, Text, x3 y346 w500 h2 +0x10
Gui Add, Button, x320 y352 w61 h23 gclose, Close
Gui Add, Button, x250 y352 w61 h23 grestart, Restart
Gui Add, Button, x170 y352 w40 h23 gcopywar vcopywar, Copy
Gui Add, Text, x10 y357 w30 h20, PCID:
Gui, Font, s8
Gosub, checkwar
	If (Waractive = 1){
		Gui Add, Edit, x44 y354 W120 h20 +ReadOnly, Active
		GuiControl, Disable, copywar
	}
	Else If (Waractive = 0){
		Gui Add, Edit, x44 y354 W120 h20 +ReadOnly, %WarEncrypted%
	}
Gui, font


Gui Tab, Baldus
Gui Add, Text, x3 y346 w500 h2 +0x10
Gui Add, Picture, x15 y20 w190 h185, BDM.png
Gui Add, Button, x320 y352 w61 h23 gclose, Close
Gui Add, Button, x250 y352 w61 h23 grestart, Restart
Gui Add, Button, x170 y352 w40 h23 gcopybaldus vcopybaldus, Copy
;Gui Add, GroupBox, x10 y210 w200 h130 +Center, Start/Stop BaldusMacro
Gui Add, GroupBox, x10 y170 w200 h50 +Center, Select Client
IniRead, ttk, %A_Temp%\MinMacro Config.ini, BaldusMacro, TTK, 40
Gui Add, GroupBox, x10 y230 w200 h50 +Center, Time To Kill Baldus
Gui Add, Edit, x220 y55 w155 h284 +ReadOnly -WantCtrlA -WantTAb -WantReturn, %bdmsteps%
Gui Add, Text, x10 y357 w30 h20, PCID:
Gui, Font, s8
Gosub, checkbaldus
	If (Baldusactive = 1){
		Gui Add, Edit, x44 y354 W120 h20 +ReadOnly, Active
		GuiControl, Disable, copybaldus
		{
			Gui Add, Button, x10 y290 w200 h50 vstopbaldus gstopbaldus Hidden, Stop BaldusMacro
			Gui Add, Button, x10 y290 w200 h50 vstartbaldus gstartbaldus, Start BaldusMacro
			Gui Add,  Edit, x20 y250 w180 h20 -VScroll vttkbaldus, %ttk%
			Gui Add, DropDownList, x20 y188 w180 vbaldusclient, Cabal Asia|For requests, send a message
		}
	}
	Else If (Baldusactive = 0){
		Gui Add, Edit, x44 y354 W120 h20 +ReadOnly, %BaldusEncrypted%
		Gui Add, Button, x10 y290 w200 h50 Disabled, Start BaldusMacro
		Gui Add,  Edit, x20 y250 w180 h20 -VScroll Disabled, %ttk%
		Gui Add, DropDownList, x20 y188 w180 Disabled, Cabal Asia|For requests, send a message
	}
Gui, font
Gui, font

Gui Tab, Basic
Gui Add, Text, x10 y357 w30 h20, PCID:
Gui Add, Text, x3 y346 w500 h2 +0x10
Gui Add, Button, x320 y352 w61 h23 gclose, Close
Gui Add, Button, x250 y352 w61 h23 grestart, Restart
Gui, Font, s8
Gui Add, Edit, x44 y354 W120 h20 +ReadOnly, Free Application
Gui, Font

Gui Tab, Premium
Gui Add, Text, x3 y346 w500 h2 +0x10
Gui Add, Button, x320 y352 w61 h23 gclose, Close
Gui Add, Button, x250 y352 w61 h23 grestart, Restart
Gui Add, Button, x170 y352 w40 h23 gcopyprem vcopyprem, Copy
Gui Add, Text, x10 y357 w30 h20, PCID:
Gui Add, Edit, x230 y55 w145 h284 +ReadOnly -WantCtrlA -WantTAb -WantReturn, %mmpsteps%
Gui Add, GroupBox, x10 y270 w210 h70 +Center, Start/Stop Auto-Attack
Gui Add, GroupBox, x10 y205 w210 h55 +Center, Toggle Auto Extract
Gui Add, GroupBox, x10 y120 w210 h80 +Center, Toggle Auto-Rechannel And Return
Gui, Font, s8
Gosub, checkprem
	If (Premactive = 1){
		Gui Add, Edit, x44 y354 W120 h20 +ReadOnly, Active
		GuiControl, Disable, copyprem
	}
	Else If (Premactive = 0){
		Gui Add, Edit, x44 y354 W120 h20 +ReadOnly, %PremEncrypted%
		{
			Gui Add, Button, x20 y290 w190 h40 Disabled, Start
			{ ;Auto Channel and return controls
				Gui Add, Button, x20 y140 w80 h23 Disabled, Start
				Gui Add, DropDownList, x20 y170 w80 Disabled, 1|2|3
				Gui Add, Text, x107 y144 Disabled, Clicks:
				Gui Add, DropDownList, x140 y141 w72 Disabled, 1|2
				Gui Add, Button, x105 y169 w32 h23 Disabled, Set
				Gui Add, Text, x138 y174, X:
				Gui Add, Edit, x150 y170 w24 h20 Disabled, 333
				Gui Add, Text, x176 y174, Y:
				Gui Add, Edit, x188 y170 w24 h20 Disabled, 333
			}
			{
				Gui Add, Button, x20 y225 w120 h25 Disabled, Start
			}
		}
	}
Gui, font


Gui Tab, SeniMacro
Gui Add, Text, x3 y346 w500 h2 +0x10
Gui Add, Button, x320 y352 w61 h23 gclose, Close
Gui Add, Button, x250 y352 w61 h23 grestart, Restart
Gui Add, Button, x170 y352 w40 h23 gcopyseni vcopyseni, Copy
Gui Add, Text, x10 y357 w30 h20, PCID:
Gui Add, Edit, x220 y55 w155 h284 +ReadOnly -WantCtrlA -WantTAb -WantReturn, %senisteps%
Gui Add, GroupBox, x10 y270 w200 h70 +Center, Start/Stop SeniMacro
Gui Add, GroupBox, x10 y210 w200 h50 +Center, Select Nation
Gui Add, GroupBox, x10 y150 w200 h50 +Center, Select Spot Channel
Gui, Font, s8
Gosub, checkseni
	If (Seniactive = 1){
		Gui Add, Edit, x44 y354 W120 h20 +ReadOnly, Active
		GuiControl, Disable, copyseni
		{
			Gui Add, Button, x20 y290 w180 h40 gstartseni vstartseni, Start
			Gui Add, Button, x20 y290 w180 h40 gstopseni vstopseni Hidden, Stop
			Gui, Font, s12
			Gui Add, Radio, x30 y230 Checked vseniproc , Procyon
			Gui Add, Radio, x120 y230 vsenicap , Capella
			Gui, Font
			Gui Add, DropDownList, x20 y168 w180 Choose7, Channel 2|Channel 3|Channel 4|Channel 5|Channel 6|Channel 7|Channel 8|Channel 9|Channel 10|Channel 11|Channel 12|Channel 13|Channel 14|Channel 15|Channel 16
		}
	}
	Else If (Seniactive = 0){
		Gui Add, Edit, x44 y354 W120 h20 +ReadOnly, %SeniEncrypted%
		{
			Gui Add, Button, x20 y290 w180 h40 Disabled, Start
			Gui, Font, s12
			Gui Add, Radio, x30 y230 Disabled, Procyon
			Gui Add, Radio, x120 y230 Disabled, Capella
			Gui, Font
			Gui Add, DropDownList, x20 y168 w180 Disabled, 
		}
	}
Gui, font


Gui Tab, Steamer
Gui Add, Text, x3 y346 w500 h2 +0x10
Gui Add, Button, x320 y352 w61 h23 gclose, Close
Gui Add, Button, x250 y352 w61 h23 grestart, Restart
Gui Add, Button, x170 y352 w40 h23 gcopysteamer vcopysteamer, Copy
Gui Add, Text, x10 y357 w30 h20, PCID:
Gui, Font, s8
Gosub, checksteamer
	If (Steameractive = 1){
		Gui Add, Edit, x44 y354 W120 h20 +ReadOnly, Active
		GuiControl, Disable, copysteamer
	}
	Else If (Steameractive = 0){
		Gui Add, Edit, x44 y354 W120 h20 +ReadOnly, %SteamerEncrypted%
	}
Gui, font


Gui Tab
Gui Show, w390 h381, Window (Clone)

OnMessage(0x200, "OnWM_MOUSEMOVE")
Return

;-------------Timers----------------
SetTimer, Attackbaldus
;-------------Start of g-labels--------------
GuiClose:
Close:
	ahkthread_free(Thread1)
	ahkthread_free()
    ExitApp
Return

Set:
	Gui, Submit, NoHide
	If (clientname = "")
	{
		MsgBox 0x30, Error Code: Empty, Please do not leave the client name blank!
		Return
	}
    SetTimer, ToolTip1, On
    KeyWait, RButton, D
        {
            MouseGetPos, , , CurrentTitle
            WinGetTitle, windowtitle, ahk_id %CurrentTitle%
            WinSetTitle, %windowtitle%,, %clientname%
        }
    SetTimer, ToolTip1, off
    ToolTip
	GuiControl, Disable, set
Return

ToolTip1:
	Gui, Submit, NoHide
    ToolTip, Right click on a window to Rename to %clientname%.
Return

Revert:
	Gui, Submit, NoHide
	WinSetTitle, %clientname%,, %windowtitle%
	GuiControl, Enable, set
Return

Restart:
	Reload
Return

installpvs:
	Gui, Submit, NoHide
	installname = Multi %pvslist%
	If (pvslist = "")
		{
			MsgBox 0x30, Error: Server not selected, Please select a server.			
			Return
		}
	FileSelectFolder, pathpvs
	IniWrite, %pathpvs%, %A_Temp%\MinMacro Config.ini, Parent Path, %pvslist%
	FileMove, %A_Temp%\%installname%.exe, %pathpvs%\%installname%.exe, 1
	IniWrite, %pathpvs%\%installname%.exe, %A_Temp%\MinMacro Config.ini, PVSPath, %pvslist%
Return


launchpvs:
	Gui, Submit, NoHide
	runname = Multi %pvslist%
	IniRead, pvslaunch, %A_Temp%\MinMacro Config.ini, PVSPath, %pvslist%
	IniRead, pvsparent, %A_Temp%\MinMacro Config.ini, Parent Path, %pvslist%
	try{
		Run, %pvslaunch%, %pvsparent%
		;msgbox, %pvslist% list | %pvslaunch% launch
		;ExitApp
	}
	catch{
		If (pvslist = NULL)
		{
			MsgBox 0x30, Error: Server not selected, Please select a server.
		}
		Else
		{		
			MsgBox 0x30, Error: File not found, Please click on "Install" and select the main folder of %pvslist%.
		}
	}
Return

installcoph:
	Gui, Submit, NoHide
	FileSelectFolder, pathcoph
	IniWrite, %pathcoph%, %A_Temp%\MinMacro Config.ini, Parent Path, COPH
	FileMove, %A_Temp%\Multi Launcher COPH.exe, %pathcoph%\Multi Launcher COPH.exe, 1
	GuiControl, Text, path, %pathcoph%
Return

launchcoph:
	Gui, Submit, NoHide
	IniRead, cophlaunch, %A_Temp%\MinMacro Config.ini, Parent Path, COPH
	Try{
		Run, %cophlaunch%\Multi Launcher COPH.exe, %cophlaunch%
	}
	catch{
		MsgBox 0x30, Error: File not found, Please click on "Install" and select the main folder of Cabal (COPH).
	}
Return

copymccoph:
	Clipboard := mccophEncrypted
Return

copymcpvs:
	Clipboard := mcpvsEncrypted
Return

copywar:
	Clipboard := WarEncrypted
Return

copybaldus:
	Clipboard := BaldusEncrypted
Return

copyprem:
	Clipboard := PremEncrypted
Return

copyseni:
	Clipboard := seniEncrypted
Return

copysteamer:
	Clipboard := steamerEncrypted
Return

OnWM_MOUSEMOVE(wParam, lParam, msg, hWnd) {
if wparam = 1 ; LButton
		PostMessage, 0xA1, 2,,, A ; WM_NCLBUTTONDOWN
}
Return


startbaldus:
	Gui, Submit, NoHide
	GuiControl, Hide, startbaldus
	GuiControl, Show, stopbaldus
	IniWrite, %ttkbaldus%, %A_Temp%\MinMacro Config.ini, BaldusMacro, TTK
	If (baldusclient = "Cabal Asia")
		{
			Goto, startcba
		}
Return

stopbaldus:
	Gosub, restart
Return


startseni:
	Gui, Submit, NoHide
	WinGetPos,,, nwidth, nheight, %clientname%
	If (seniproc = true)
	{

	}
	Else If (senicap = true)
	{
		
	}
	Else If (senicap = false && seniproc = false)
	{
	
	}
Return

stopseni:

Return


;------------
attackcoph:
Gui, Submit, NoHide
attackcophmain =
		(	
			#Persistent
			#SingleInstance Off
			#NoTrayIcon
			DetectHiddenWindows on
			SetTitleMatchMode, 3
			SetControlDelay -1

			SetTimer, Target, 2000
			SetTimer, Skills
			Skills:
			SetControlDelay 50
			ControlClick, x220 y607, %clientname%,, Right,, NA Pos
			ControlClick, x250 y607, %clientname%,, Right,, NA Pos	
			ControlClick, x280 y607, %clientname%,, Right,, NA Pos
			ControlClick, x310 y607, %clientname%,, Right,, NA Pos
			ControlClick, x340 y607, %clientname%,, Right,, NA Pos
			ControlClick, x370 y607, %clientname%,, Right,, NA Pos	
			ControlClick, x400 y607, %clientname%,, Right,, NA Pos
			ControlClick, x430 y607, %clientname%,, Right,, NA Pos
			ControlClick, x460 y607, %clientname%,, Right,, NA Pos	
			ControlClick, x490 y607, %clientname%,, Right,, NA Pos
			ControlClick, x520 y607, %clientname%,, Right,, NA Pos
			ControlClick, x550 y607, %clientname%,, Right,, NA Pos
			ControlClick, x580 y607, %clientname%,, Right,, NA Pos	
		return
			Target:
			ControlClick,, %clientname%,, Middle,, NA
		return
		)
attackcoph := AhkThread(attackcophmain)
Return

extractcoph:
Gui, Submit, NoHide
extractcophmain = 
(
	#Persistent
	#SingleInstance Off
	#NoTrayIcon
	DetectHiddenWindows on
	SetTitleMatchMode, 3
	SetControlDelay -1
	
	Controlclick, x640 y610, %clientname%,, Left,, NA Pos ;C
	Sleep, 500
	ControlClick, x560 y520, %clientname%,, Left,, NA Pos ;Guild
	Sleep, 1000	
	ControlClick, x640 y609, %clientname%,, Left,, NA ; C
	Sleep, 500
	ControlClick, x714 y119, %clientname%,, Left,, NA ; Open Inv
	Sleep, 500
	Loop
	{
		ControlClick, x629 y579, %clientname%,, Left,, NA ; Auto sort
		Sleep, 150
		ControlClick, x660 y560, %clientname%,, Left,, NA ; ITEM EXTRACT MODE
		Sleep, 150
		ControlClick, x660 y560, %clientname%,, Left,, NA ; ITEM EXTRACT MODE
		Sleep, 150
		ControlClick, x660 y560, %clientname%,, Left,, NA ; ITEM EXTRACT MODE
		Sleep, 150
		ControlClick, x631 y344, %clientname%,, Left,, NA ; OPEN SLOT I
		Sleep, 150
		
		ControlClick, x628 y372, %clientname%,, Right,, NA
		Sleep, 200
		ControlClick, x672 y372, %clientname%,, Right,, NA
		Sleep, 200
		ControlClick, x716 y372, %clientname%,, Right,, NA
		Sleep, 200
		ControlClick, x762 y372, %clientname%,, Right,, NA
		Sleep, 200
		
		
		ControlClick, x467 y457, %clientname%,, Left,, NA ; ITEM EXTRACT
		Sleep, 150
		ControlClick, x423 y422, %clientname%,, Left,, NA ; AGREE 
		Sleep, 1200
		ControlClick, x534 y499, %clientname%,, Left,, NA ; CLOSE
		Sleep, 150
		ControlClick, x539 y458, %clientname%,, Left,, NA ; Cancel
		Sleep, 150
	}
return
)
extractcoph := AhkThread(extractcophmain)
Return

extractcophslow:
Gui, Submit, NoHide
extractcophslowmain =
(
	#Persistent
	#SingleInstance Off
	#NoTrayIcon
	DetectHiddenWindows on
	SetTitleMatchMode, 3
	SetControlDelay -1
	SetTimer, Extract, 60000
	Extract:
		Controlclick, x640 y610, %clientname%,, Left,, NA Pos ;C
		Sleep, 500
		ControlClick, x560 y520, %clientname%,, Left,, NA Pos ;Guild
		Sleep, 1000
		
		ControlClick, x640 y609, %clientname%,, Left,, NA ; C
		Sleep, 500
		ControlClick, x714 y119, %clientname%,, Left,, NA ; Open Inv
		Sleep, 1000
		ControlClick, x629 y579, %clientname%,, Left,, NA ; Auto sort
		Sleep, 250
		ControlClick, x660 y560, %clientname%,, Left,, NA ; ITEM EXTRACT MODE
		Sleep, 250
		ControlClick, x660 y560, %clientname%,, Left,, NA ; ITEM EXTRACT MODE
		Sleep, 250
		ControlClick, x660 y560, %clientname%,, Left,, NA ; ITEM EXTRACT MODE
		Sleep, 250
		ControlClick, x631 y344, %clientname%,, Left,, NA ; OPEN SLOT I
		Sleep, 250
		
		ControlClick, x628 y372, %clientname%,, Right,, NA
		Sleep, 500
		ControlClick, x672 y372, %clientname%,, Right,, NA
		Sleep, 500
		ControlClick, x716 y372, %clientname%,, Right,, NA
		Sleep, 500
		ControlClick, x762 y372, %clientname%,, Right,, NA
		Sleep, 500
		
		
		ControlClick, x467 y457, %clientname%,, Left,, NA ; ITEM EXTRACT
		Sleep, 1000
		ControlClick, x423 y422, %clientname%,, Left,, NA ; AGREE 
		Sleep, 1000
		ControlClick, x534 y499, %clientname%,, Left,, NA ; CLOSE
		Sleep, 1000
		ControlClick, x539 y458, %clientname%,, Left,, NA ; Cancel
		Sleep, 1000
		ControlClick, x629 y579, %clientname%,, Left,, NA ; Auto sort
		Sleep, 250
		ControlClick, x660 y560, %clientname%,, Left,, NA ; ITEM EXTRACT MODE
		Sleep, 250
		ControlClick, x660 y560, %clientname%,, Left,, NA ; ITEM EXTRACT MODE
		Sleep, 250
		ControlClick, x660 y560, %clientname%,, Left,, NA ; ITEM EXTRACT MODE
		Sleep, 250
		ControlClick, x631 y344, %clientname%,, Left,, NA ; OPEN SLOT I
		Sleep, 250
		
		ControlClick, x628 y418, %clientname%,, Right,, NA
		Sleep, 500
		ControlClick, x672 y418, %clientname%,, Right,, NA
		Sleep, 500
		ControlClick, x716 y418, %clientname%,, Right,, NA
		Sleep, 500
		ControlClick, x762 y418, %clientname%,, Right,, NA
		Sleep, 500
		
		ControlClick, x467 y457, %clientname%,, Left,, NA ; ITEM EXTRACT
		Sleep, 1000
		ControlClick, x423 y422, %clientname%,, Left,, NA ; AGREE 
		Sleep, 1000
		ControlClick, x534 y499, %clientname%,, Left,, NA ; CLOSE
		Sleep, 1000
		ControlClick, x539 y458, %clientname%,, Left,, NA ; Cancel
		Sleep, 1000
		
		ControlClick, x798 y42, %clientname%,, Left,, NA ;Close inv
		Sleep, 500
		ControlClick, x625 y530, %clientname%,, Left,, NA Pos ;Close Guild
		Return
)
extractcophslow := AhkThread(extractcophslowmain)
Return
;------------------Licenses Encrypt Decrypt-----------------

mccoph:
   PCdata = %A_username%%A_is64bitos%%A_Language%%A_computername%%A_desktop%
   PCdata = %PCdata%%A_WinDir%%A_OSType%%A_OSVersion%%A_Temp%
   mccophEncrypted1 := Crypt.Encrypt.StrEncrypt(PCdata,mccoph,, 1)
   mccophEncrypted := Crypt.Encrypt.StrEncrypt(mccophEncrypted1,mccoph,, 1)
   getver := ComObjCreate("WinHttp.WinHttpRequest.5.1")
   getver.Open("GET", "https://raw.githubusercontent.com/jollyjoee/minmacro/main/mccoph")
   getver.Send()
   getver.WaitForResponse()
   dbkey := getver.ResponseText
   If InStr(dbkey, mccophEncrypted)
   {
		mccophactive := 1
   }
   else
   {
		mccophactive := 0
   }
return

mcpvs:
   PCdata = %A_username%%A_is64bitos%%A_Language%%A_computername%%A_desktop%
   PCdata = %PCdata%%A_WinDir%%A_OSType%%A_OSVersion%%A_Temp%
   mcpvsEncrypted1 := Crypt.Encrypt.StrEncrypt(PCdata,mcpvs,, 1)
   mcpvsEncrypted := Crypt.Encrypt.StrEncrypt(mcpvsEncrypted1,mcpvs,, 1)
   getver := ComObjCreate("WinHttp.WinHttpRequest.5.1")
   getver.Open("GET", "https://raw.githubusercontent.com/jollyjoee/minmacro/main/mcpvs")
   getver.Send()
   getver.WaitForResponse()
   dbkey := getver.ResponseText
   If InStr(dbkey, mcpvsEncrypted)
   {
		mcpvsactive := 1
   }
   else
   {
		mcpvsactive := 0
   }
return

checkwar:
   PCdata = %A_username%%A_is64bitos%%A_Language%%A_computername%%A_desktop%
   PCdata = %PCdata%%A_WinDir%%A_OSType%%A_OSVersion%%A_Temp%
   WarEncrypted1 := Crypt.Encrypt.StrEncrypt(PCdata,Autowar,, 1)
   WarEncrypted := Crypt.Encrypt.StrEncrypt(WarEncrypted1,Autowar,, 1)
   getver := ComObjCreate("WinHttp.WinHttpRequest.5.1")
   getver.Open("GET", "https://raw.githubusercontent.com/jollyjoee/minmacro/main/war")
   getver.Send()
   getver.WaitForResponse()
   dbkey := getver.ResponseText
   If InStr(dbkey, WarEncrypted)
   {
		Waractive := 1
   }
   else
   {
		Waractive := 0
   }
return

checkbaldus:
   PCdata = %A_username%%A_is64bitos%%A_Language%%A_computername%%A_desktop%
   PCdata = %PCdata%%A_WinDir%%A_OSType%%A_OSVersion%%A_Temp%
   BaldusEncrypted1 := Crypt.Encrypt.StrEncrypt(PCdata,Baldus,, 1)
   BaldusEncrypted := Crypt.Encrypt.StrEncrypt(BaldusEncrypted1,Baldus,, 1)
   getver := ComObjCreate("WinHttp.WinHttpRequest.5.1")
   getver.Open("GET", "https://raw.githubusercontent.com/jollyjoee/minmacro/main/bald")
   getver.Send()
   getver.WaitForResponse()
   dbkey := getver.ResponseText
   If InStr(dbkey, BaldusEncrypted)
   {
		Baldusactive := 1
   }
   else
   {
		Baldusactive := 0
   }
return

checkprem:
   PCdata = %A_username%%A_is64bitos%%A_Language%%A_computername%%A_desktop%
   PCdata = %PCdata%%A_WinDir%%A_OSType%%A_OSVersion%%A_Temp%
   PremEncrypted1 := Crypt.Encrypt.StrEncrypt(PCdata,Premium,, 1)
   PremEncrypted := Crypt.Encrypt.StrEncrypt(PremEncrypted1,Premium,, 1)
   getver := ComObjCreate("WinHttp.WinHttpRequest.5.1")
   getver.Open("GET", "https://raw.githubusercontent.com/jollyjoee/minmacro/main/prem")
   getver.Send()
   getver.WaitForResponse()
   dbkey := getver.ResponseText
   If InStr(dbkey, PremEncrypted)
   {
		Premactive := 1
   }
   else
   {
		Premactive := 0
   }
return

checkseni:
   PCdata = %A_username%%A_is64bitos%%A_Language%%A_computername%%A_desktop%
   PCdata = %PCdata%%A_WinDir%%A_OSType%%A_OSVersion%%A_Temp%
   SeniEncrypted1 := Crypt.Encrypt.StrEncrypt(PCdata,Senimacro,, 1)
   SeniEncrypted := Crypt.Encrypt.StrEncrypt(SeniEncrypted1,Senimacro,, 1)
   getver := ComObjCreate("WinHttp.WinHttpRequest.5.1")
   getver.Open("GET", "https://raw.githubusercontent.com/jollyjoee/minmacro/main/seni")
   getver.Send()
   getver.WaitForResponse()
   dbkey := getver.ResponseText
   If InStr(dbkey, SeniEncrypted)
   {
		Seniactive := 1
   }
   else
   {
		Seniactive := 0
   }
return

checksteamer:
   PCdata = %A_username%%A_is64bitos%%A_Language%%A_computername%%A_desktop%
   PCdata = %PCdata%%A_WinDir%%A_OSType%%A_OSVersion%%A_Temp%
   SteamerEncrypted1 := Crypt.Encrypt.StrEncrypt(PCdata,Steamer,, 1)
   SteamerEncrypted := Crypt.Encrypt.StrEncrypt(SteamerEncrypted1,Steamer,, 1)
   getver := ComObjCreate("WinHttp.WinHttpRequest.5.1")
   getver.Open("GET", "https://raw.githubusercontent.com/jollyjoee/minmacro/main/steam")
   getver.Send()
   getver.WaitForResponse()
   dbkey := getver.ResponseText
   If InStr(dbkey, SteamerEncrypted)
   {
		Steameractive := 1
   }
   else
   {
		Steameractive := 0
   }
return
;-------------------Scripts------------------
startcba:
	Gui, Submit, nohide
	durationbaldusattack := (ttkbaldus * 1000)
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA 
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	Sleep, 2000
	ControlClick, x338 y233, %clientname%,, Left,, NA 
	ControlClick, x338 y233, %clientname%,, Left,, NA  ; ds warp
	ControlClick, x338 y233, %clientname%,, Left,, NA  
	ControlClick, x338 y233, %clientname%,, Left,, NA  
	ControlClick, x338 y233, %clientname%,, Left,, NA  
	ControlClick, x338 y233, %clientname%,, Left,, NA 
	Sleep, 5000
	ControlClick, x446 y359, %clientname%,, Left,, NA 
	ControlClick, x446 y359, %clientname%,, Left,, NA 
	Sleep, 4500
	ControlClick, x296 y565, %clientname%,, Right,, NA ; dash
	Sleep, 2500
	
	ControlClick, x430 y334, %clientname%,, Left,, NA
	ControlClick, x430 y334, %clientname%,, Left,, NA
	ControlClick, x430 y334, %clientname%,, Left,, NA
	ControlClick, x430 y334, %clientname%,, Left,, NA
	ControlClick, x430 y334, %clientname%,, Left,, NA
	ControlClick, x430 y334, %clientname%,, Left,, NA ; vendor
	ControlClick, x430 y334, %clientname%,, Left,, NA
	ControlClick, x430 y334, %clientname%,, Left,, NA
	ControlClick, x430 y334, %clientname%,, Left,, NA
	ControlClick, x430 y334, %clientname%,, Left,, NA
	ControlClick, x430 y334, %clientname%,, Left,, NA
	ControlClick, x430 y334, %clientname%,, Left,, NA
	ControlClick, x430 y334, %clientname%,, Left,, NA
	ControlClick, x430 y334, %clientname%,, Left,, NA
	ControlClick, x430 y334, %clientname%,, Left,, NA
	ControlClick, x430 y334, %clientname%,, Left,, NA ; vendor
	ControlClick, x430 y334, %clientname%,, Left,, NA
	ControlClick, x430 y334, %clientname%,, Left,, NA
	ControlClick, x430 y334, %clientname%,, Left,, NA
	ControlClick, x430 y334, %clientname%,, Left,, NA
	
	Sleep, 1500
	ControlClick, x171 y478, %clientname%,, Left,, NA ; key 1 
	Sleep, 500
	ControlClick, x296 y379, %clientname%,, Left,, NA ;  ; ask no more
	Sleep, 500
	ControlClick, x411 y381, %clientname%,, Left,, NA ;  ; yes
	Sleep, 500
	ControlClick, x171 y478, %clientname%,, Left,, NA ; key 2
	Sleep, 500
	ControlClick, x171 y478, %clientname%,, Left,, NA ; key 3
	Sleep, 500
	ControlClick, x171 y478, %clientname%,, Left,, NA ; key 4
	Sleep, 500
	ControlClick, x171 y478, %clientname%,, Left,, NA ; key 5
	Sleep, 500
	ControlClick, x171 y478, %clientname%,, Left,, NA ; key 6
	Sleep, 500
	ControlClick, x171 y478, %clientname%,, Left,, NA ; key 7
	Sleep, 500
	ControlClick, x171 y478, %clientname%,, Left,, NA ; key 8
	Sleep, 500
	ControlClick, x171 y478, %clientname%,, Left,, NA ; key 9
	Sleep, 500
	ControlClick, x171 y478, %clientname%,, Left,, NA ; key 10
	Sleep, 1500
	ControlClick, x209 y90, %clientname%,, Left,, NA
	Sleep, 1000
	ControlClick, x585 y602, %clientname%,, Left,, NA ; cabal menu
	Sleep, 1000
	ControlClick, x649 y272, %clientname%,, Left,, NA ; gps
	Sleep, 1000
	ControlClick, x580 y207, %clientname%,, Left,, NA ; bi
	Sleep, 1000
	ControlClick, x317 y415, %clientname%,, Left,, NA ; warp
	Sleep, 5000
	ControlClick, x767 y146, %clientname%,, Left,, NA ; open shop
	Sleep, 3000
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x622 y334, %clientname%,, Right,, NA ; baldus tp
	Sleep, 4000
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	Sleep, 2000
	ControlClick, x211 y569, %clientname%,, Right,, NA  ; buff 1
	Sleep, 1500
	ControlClick, x243 y569, %clientname%,, Right,, NA  ; buff 2
	Sleep, 1500
	ControlClick, x272 y569, %clientname%,, Right,, NA  ; buff 3
	Sleep, 1500
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	Sleep, 2000
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	Sleep, 5000
	ControlClick, x324 y468, %clientname%,, Left,, NA  ; challenge
	Sleep, 2000
	SetTimer, Attackbaldus, On
	Sleep, %durationbaldusattack%
	SetTimer, Attackbaldus, Off
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	Sleep, 1000
	ControlClick, x406 y469, %clientname%,, Left,, NA  ; roll dice
	Sleep, 1000
	ControlClick, x406 y469, %clientname%,, Left,, NA  ; roll dice
	Sleep, 5000
	
	
	ControlClick,, %clientname%,, WheelDown, 6 , NA ; 2nd run
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	Sleep, 2000
	ControlClick, x211 y569, %clientname%,, Right,, NA  ; buff 1
	Sleep, 1500
	ControlClick, x243 y569, %clientname%,, Right,, NA  ; buff 2
	Sleep, 1500
	ControlClick, x272 y569, %clientname%,, Right,, NA  ; buff 3
	Sleep, 1500
	ControlClick, x767 y146, %clientname%,, Left,, NA ; open shop
	Sleep, 3000
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x622 y334, %clientname%,, Right,, NA ; baldus tp
	Sleep, 4000
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	Sleep, 2000
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	Sleep, 5000
	ControlClick, x324 y468, %clientname%,, Left,, NA  ; challenge
	Sleep, 2000
	SetTimer, Attackbaldus, On
	Sleep, %durationbaldusattack%
	SetTimer, Attackbaldus, Off
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	Sleep, 1000
	ControlClick, x406 y469, %clientname%,, Left,, NA  ; roll dice
	Sleep, 1000
	ControlClick, x406 y469, %clientname%,, Left,, NA  ; roll dice
	Sleep, 5000
	
	
	ControlClick,, %clientname%,, WheelDown, 6 , NA ; 3rd run
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	Sleep, 2000
	ControlClick, x211 y569, %clientname%,, Right,, NA  ; buff 1
	Sleep, 1500
	ControlClick, x243 y569, %clientname%,, Right,, NA  ; buff 2
	Sleep, 1500
	ControlClick, x272 y569, %clientname%,, Right,, NA  ; buff 3
	Sleep, 1500
	ControlClick, x767 y146, %clientname%,, Left,, NA ; open shop
	Sleep, 3000
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x622 y334, %clientname%,, Right,, NA ; baldus tp
	Sleep, 4000
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	Sleep, 2000
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	Sleep, 5000
	ControlClick, x324 y468, %clientname%,, Left,, NA  ; challenge
	Sleep, 2000
	SetTimer, Attackbaldus, On
	Sleep, %durationbaldusattack%
	SetTimer, Attackbaldus, Off
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	Sleep, 1000
	ControlClick, x406 y469, %clientname%,, Left,, NA  ; roll dice
	Sleep, 1000
	ControlClick, x406 y469, %clientname%,, Left,, NA  ; roll dice
	Sleep, 5000
	
	
	ControlClick,, %clientname%,, WheelDown, 6 , NA ; 4th run
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	Sleep, 2000
	ControlClick, x211 y569, %clientname%,, Right,, NA  ; buff 1
	Sleep, 1500
	ControlClick, x243 y569, %clientname%,, Right,, NA  ; buff 2
	Sleep, 1500
	ControlClick, x272 y569, %clientname%,, Right,, NA  ; buff 3
	Sleep, 1500
	ControlClick, x767 y146, %clientname%,, Left,, NA ; open shop
	Sleep, 3000
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x622 y334, %clientname%,, Right,, NA ; baldus tp
	Sleep, 4000
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	Sleep, 2000
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	Sleep, 5000
	ControlClick, x324 y468, %clientname%,, Left,, NA  ; challenge
	Sleep, 2000
	SetTimer, Attackbaldus, On
	Sleep, %durationbaldusattack%
	SetTimer, Attackbaldus, Off
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	Sleep, 1000
	ControlClick, x406 y469, %clientname%,, Left,, NA  ; roll dice
	Sleep, 1000
	ControlClick, x406 y469, %clientname%,, Left,, NA  ; roll dice
	Sleep, 5000
	
	
	ControlClick,, %clientname%,, WheelDown, 6 , NA ; 5th run
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	Sleep, 2000
	ControlClick, x211 y569, %clientname%,, Right,, NA  ; buff 1
	Sleep, 1500
	ControlClick, x243 y569, %clientname%,, Right,, NA  ; buff 2
	Sleep, 1500
	ControlClick, x272 y569, %clientname%,, Right,, NA  ; buff 3
	Sleep, 1500
	ControlClick, x767 y146, %clientname%,, Left,, NA ; open shop
	Sleep, 3000
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x622 y334, %clientname%,, Right,, NA ; baldus tp
	Sleep, 4000
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	Sleep, 2000
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	Sleep, 5000
	ControlClick, x324 y468, %clientname%,, Left,, NA  ; challenge
	Sleep, 2000
	SetTimer, Attackbaldus, On
	Sleep, %durationbaldusattack%
	SetTimer, Attackbaldus, Off
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	Sleep, 1000
	ControlClick, x406 y469, %clientname%,, Left,, NA  ; roll dice
	Sleep, 1000
	ControlClick, x406 y469, %clientname%,, Left,, NA  ; roll dice
	Sleep, 5000
	
	
	ControlClick,, %clientname%,, WheelDown, 6 , NA ; 6th run
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	Sleep, 2000
	ControlClick, x211 y569, %clientname%,, Right,, NA  ; buff 1
	Sleep, 1500
	ControlClick, x243 y569, %clientname%,, Right,, NA  ; buff 2
	Sleep, 1500
	ControlClick, x272 y569, %clientname%,, Right,, NA  ; buff 3
	Sleep, 1500
	ControlClick, x767 y146, %clientname%,, Left,, NA ; open shop
	Sleep, 3000
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x622 y334, %clientname%,, Right,, NA ; baldus tp
	Sleep, 4000
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	Sleep, 2000
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	Sleep, 5000
	ControlClick, x324 y468, %clientname%,, Left,, NA  ; challenge
	Sleep, 2000
	SetTimer, Attackbaldus, On
	Sleep, %durationbaldusattack%
	SetTimer, Attackbaldus, Off
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	Sleep, 1000
	ControlClick, x406 y469, %clientname%,, Left,, NA  ; roll dice
	Sleep, 1000
	ControlClick, x406 y469, %clientname%,, Left,, NA  ; roll dice
	Sleep, 5000
	
	
	ControlClick,, %clientname%,, WheelDown, 6 , NA ; 7th run
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	Sleep, 2000
	ControlClick, x211 y569, %clientname%,, Right,, NA  ; buff 1
	Sleep, 1500
	ControlClick, x243 y569, %clientname%,, Right,, NA  ; buff 2
	Sleep, 1500
	ControlClick, x272 y569, %clientname%,, Right,, NA  ; buff 3
	Sleep, 1500
	ControlClick, x767 y146, %clientname%,, Left,, NA ; open shop
	Sleep, 3000
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x622 y334, %clientname%,, Right,, NA ; baldus tp
	Sleep, 4000
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	Sleep, 2000
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	Sleep, 5000
	ControlClick, x324 y468, %clientname%,, Left,, NA  ; challenge
	Sleep, 2000
	SetTimer, Attackbaldus, On
	Sleep, %durationbaldusattack%
	SetTimer, Attackbaldus, Off
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	Sleep, 1000
	ControlClick, x406 y469, %clientname%,, Left,, NA  ; roll dice
	Sleep, 1000
	ControlClick, x406 y469, %clientname%,, Left,, NA  ; roll dice
	Sleep, 5000
	
	
	ControlClick,, %clientname%,, WheelDown, 6 , NA ; 8th run
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	Sleep, 2000
	ControlClick, x211 y569, %clientname%,, Right,, NA  ; buff 1
	Sleep, 1500
	ControlClick, x243 y569, %clientname%,, Right,, NA  ; buff 2
	Sleep, 1500
	ControlClick, x272 y569, %clientname%,, Right,, NA  ; buff 3
	Sleep, 1500
	ControlClick, x767 y146, %clientname%,, Left,, NA ; open shop
	Sleep, 3000
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x622 y334, %clientname%,, Right,, NA ; baldus tp
	Sleep, 4000
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	Sleep, 2000
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	Sleep, 5000
	ControlClick, x324 y468, %clientname%,, Left,, NA  ; challenge
	Sleep, 2000
	SetTimer, Attackbaldus, On
	Sleep, %durationbaldusattack%
	SetTimer, Attackbaldus, Off
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	Sleep, 1000
	ControlClick, x406 y469, %clientname%,, Left,, NA  ; roll dice
	Sleep, 1000
	ControlClick, x406 y469, %clientname%,, Left,, NA  ; roll dice
	Sleep, 5000
	
	
	ControlClick,, %clientname%,, WheelDown, 6 , NA ; 9th run
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	Sleep, 2000
	ControlClick, x211 y569, %clientname%,, Right,, NA  ; buff 1
	Sleep, 1500
	ControlClick, x243 y569, %clientname%,, Right,, NA  ; buff 2
	Sleep, 1500
	ControlClick, x272 y569, %clientname%,, Right,, NA  ; buff 3
	Sleep, 1500
	ControlClick, x767 y146, %clientname%,, Left,, NA ; open shop
	Sleep, 3000
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x622 y334, %clientname%,, Right,, NA ; baldus tp
	Sleep, 4000
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	Sleep, 2000
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	Sleep, 5000
	ControlClick, x324 y468, %clientname%,, Left,, NA  ; challenge
	Sleep, 2000
	SetTimer, Attackbaldus, On
	Sleep, %durationbaldusattack%
	SetTimer, Attackbaldus, Off
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	Sleep, 1000
	ControlClick, x406 y469, %clientname%,, Left,, NA  ; roll dice
	Sleep, 1000
	ControlClick, x406 y469, %clientname%,, Left,, NA  ; roll dice
	Sleep, 5000
	
	
	ControlClick,, %clientname%,, WheelDown, 6 , NA ; 10th run
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	ControlClick,, %clientname%,, WheelDown, 6 , NA
	Sleep, 2000
	ControlClick, x211 y569, %clientname%,, Right,, NA  ; buff 1
	Sleep, 1500
	ControlClick, x243 y569, %clientname%,, Right,, NA  ; buff 2
	Sleep, 1500
	ControlClick, x272 y569, %clientname%,, Right,, NA  ; buff 3
	Sleep, 1500
	ControlClick, x767 y146, %clientname%,, Left,, NA ; open shop
	Sleep, 3000
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	Sleep, 1500
	ControlClick, x622 y334, %clientname%,, Right,, NA ; baldus tp
	Sleep, 4000
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	ControlClick, x572 y382, %clientname%,, Left,, NA ; secu
	Sleep, 2000
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	ControlClick, x204 y454, %clientname%,, Left,, NA  ; enter dg
	Sleep, 5000
	ControlClick, x324 y468, %clientname%,, Left,, NA  ; challenge
	Sleep, 2000
	SetTimer, Attackbaldus, On
	Sleep, %durationbaldusattack%
	SetTimer, Attackbaldus, Off
	Sleep, 2000
	Gosub, exitcba
return

Attackbaldus:
	Gui, Submit, Nohide
	ControlClick,, %clientname%,, Middle,, NA
	Sleep, 50
	ControlClick, x220 y607, %clientname%,, Right,, NA Pos	
	Sleep 50
	ControlClick, x250 y607, %clientname%,, Right,, NA Pos
	Sleep, 50
	ControlClick, x280 y607, %clientname%,, Right,, NA Pos
	Sleep, 50
	ControlClick, x310 y607, %clientname%,, Right,, NA Pos
	Sleep, 50
	ControlClick, x340 y607, %clientname%,, Right,, NA Pos
	Sleep, 50
	ControlClick, x370 y607, %clientname%,, Right,, NA Pos	
	Sleep, 50
	ControlClick, x400 y607, %clientname%,, Right,, NA Pos
	Sleep, 50
	ControlClick, x430 y607, %clientname%,, Right,, NA Pos
	Sleep, 50
	ControlClick, x460 y607, %clientname%,, Right,, NA Pos
	Sleep, 50
	ControlClick, x490 y607, %clientname%,, Right,, NA Pos
	Sleep, 50
	ControlClick, x520 y607, %clientname%,, Right,, NA Pos
	Sleep, 50
	ControlClick, x550 y607, %clientname%,, Right,, NA Pos
	Sleep, 50
	ControlClick, x580 y607, %clientname%,, Right,, NA Pos	
	Sleep, 50
return

exitcba:
	Gui, Submit, Nohide
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	ControlClick, x798 y502, %clientname%,, Left,, NA  ; end dg
	Sleep, 1000
	ControlClick, x406 y469, %clientname%,, Left,, NA  ; roll dice
	Sleep, 1000
	ControlClick, x406 y469, %clientname%,, Left,, NA  ; roll dice
	Sleep, 4000
	ControlClick, x585 y602, %clientname%,, Left,, NA ; cabal menu
	Sleep, 2000
	ControlClick, x649 y272, %clientname%,, Left,, NA ; gps
	Sleep, 2000
	ControlClick, x579 y251, %clientname%,, Left,, NA ; DS
	Sleep, 2000
	ControlClick, x364 y247, %clientname%,, Left,, NA ; warp
	Sleep, 5000
	ControlClick, x767 y146, %clientname%,, Left,, NA ; open shop
	Sleep, 3000
	ControlClick, x624 y300, %clientname%,, Left,, NA ; slot 1
	ControlClick, x649 y327, %clientname%,, Right,, NA ; ds frontier
	Sleep, 1500
	GoSub, startcba
return


;-------------------End of scripts------------------

EM_SetCueBanner(hWnd, Cue)
{
    static EM_SETCUEBANNER := 0x1501
    return DllCall("User32.dll\SendMessage", "Ptr", hWnd, "UInt", EM_SETCUEBANNER, "Ptr", True, "WStr", Cue)
}

/*
Crypt class
	Currently Contains two classes and different methods for encryption and hashing
Classes:
	Crypt.Encrypt - Encryption class
	Crypt.Hash - Hashing class
=====================================================================
Methods:
=====================================================================
Crypt.Encrypt.FileEncrypt(pFileIn,pFileOut,password,CryptAlg = 1, HashAlg = 1)
	Encrypts the file
Parameters:
	pFileIn - path to file which to encrypt
	pFileOut - path to save encrypted file
	password - no way, it's just a password...
	(optional) CryptAlg - Encryption algorithm ID, for details see below
	(optional) HashAlg - hashing algorithm ID, for details see below
Return:
	on success, - Number of bytes writen to pFileOut
	on fail, - ""
--------
Crypt.Encrypt.FileDecrypt(pFileIn,pFileOut,password,CryptAlg = 1, HashAlg = 1)
	Decrypts the file, the parameters are identical to FileEncrypt,	except:
	pFileIn - path to encrypted file which to decrypt
	pFileOut - path to save decrypted file
=====================================================================
Crypt.Encrypt.StrEncrypt(string,password,CryptAlg = 1, HashAlg = 1)
	Encrypts the string
Parameters:
	string - UTF string, means any string you use in AHK_L Unicode
	password - no way, it's just a password...
	(optional) CryptAlg - Encryption algorithm ID, for details see below
	(optional) HashAlg - hashing algorithm ID, for details see below
Return:
	on success, - HASH representaion of encrypted buffer, which is easily transferable. 
				You can get actual encrypted buffer from HASH by using function HashToByte()
	on fail, - ""	
--------
Crypt.Encrypt.StrDecrypt(EncryptedHash,password,CryptAlg = 1, HashAlg = 1)
	Decrypts the string, the parameters are identical to StrEncrypt,	except:
	EncryptedHash - hash string returned by StrEncrypt()
=====================================================================
Crypt.Hash.FileHash(pFile,HashAlg = 1,pwd = "",hmac_alg = 1)
--------
	Gets the HASH of file
Parameters:
	pFile - path to file which hash will be calculated
	(optional) HashAlg - hashing algorithm ID, for details see below
	(optional) pwd - password, if present - the hashing algorith will use HMAC to calculate hash
	(optional) hmac_alg - Encryption algorithm ID of HMAC key, will be used if pwd parameter present
Return:
	on success, - HASH of target file calculated using choosen algorithm
	on fail, - ""
--------
Crypt.Hash.StrHash(string,HashAlg = 1,pwd = "",hmac_alg = 1)
	Gets the HASH of string. HASH will be calculated for ANSI representation of passed string
Parameters:
	string - UTF string
	other parameters same as for FileHash
=====================================================================
FileEncryptToStr(pFileIn,password,CryptAlg = 1, HashAlg = 1)
--------
	Encrypt file and returns it's hash
Parameters:
	pFileIn - path to file which will be encrypted
	password - no way, it's just a password...
	(optional) CryptAlg - Encryption algorithm ID, for details see below
	(optional) HashAlg - hashing algorithm ID, for details see below
Return:
	on success, - HASH of target file calculated using choosen algorithm
	on fail, - ""
=====================================================================
StrDecryptToFile(EncryptedHash,pFileOut,password,CryptAlg = 1, HashAlg = 1)
	Decrypt EncryptedHash to file and returns amount of bytes writen to file
Parameters:
	EncryptedHash - hash of formerly encrypted data
	pFileOut - path to destination file where decrypted data will be writen
	password - no way, it's just a password...
	(optional) CryptAlg - Encryption algorithm ID, for details see below
	(optional) HashAlg - hashing algorithm ID, for details see below
Return:
	on success, - amount of bytes writen to the destination file
	on fail, - ""
=====================================================================
Crypt.Encrypt class contain following fields
Crypt.Encrypt.StrEncoding - encoding of string passed to Crypt.Encrypt.StrEncrypt()
Crypt.Encrypt.PassEncoding - password encoding for each of Crypt.Encrypt methods

Same is valid for Crypt.Hash class

HASH and Encryption algorithms currently available:
HashAlg IDs:
1 - MD5
2 - MD2
3 - SHA
4 - SHA_256	;Vista+ only
5 - SHA_384	;Vista+ only
6 - SHA_512	;Vista+ only
--------
CryptAlg and hmac_alg IDs:
1 - RC4
2 - RC2
3 - 3DES
4 - 3DES_112
5 - AES_128 ;not supported for win 2000
6 - AES_192 ;not supported for win 2000
7 - AES_256 ;not supported for win 2000
=====================================================================

*/

class Crypt
{
	class Encrypt
	{
		static StrEncoding := "UTF-16"
		static PassEncoding := "UTF-16"
		
		StrDecryptToFile(EncryptedHash,pFileOut,password,CryptAlg = 1, HashAlg = 1) 
		{
			if !EncryptedHash
				return ""
			if !len := b64Decode( EncryptedHash, encr_Buf )
				return ""
			temp_file := "crypt.temp"
			f := FileOpen(temp_file,"w","CP0")
			if !IsObject(f)
				return ""
			if !f.RawWrite(encr_Buf,len)
				return ""
			f.close()
			bytes := this._Encrypt( p, pp, password, 0, temp_file, pFileOut, CryptAlg, HashAlg )
			FileDelete,% temp_file
			return bytes
		}
		
		FileEncryptToStr(pFileIn,password,CryptAlg = 1, HashAlg = 1) 
		{
			temp_file := "crypt.temp"
			if !this._Encrypt( p, pp, password, 1, pFileIn, temp_file, CryptAlg, HashAlg )
				return ""
			f := FileOpen(temp_file,"r","CP0")
			if !IsObject(f)
			{
				FileDelete,% temp_file
				return ""
			}
			f.Pos := 0
			fLen := f.Length
			VarSetCapacity(tembBuf,fLen,0)
			if !f.RawRead(tembBuf,fLen)
			{
				Free(tembBuf)
				return ""
			}
			f.Close()
			FileDelete,% temp_file
			return b64Encode( tembBuf, fLen )
		}
		
		FileEncrypt(pFileIn,pFileOut,password,CryptAlg = 1, HashAlg = 1)
		{
			return this._Encrypt( p, pp, password, 1, pFileIn, pFileOut, CryptAlg, HashAlg )
		}

		FileDecrypt(pFileIn,pFileOut,password,CryptAlg = 1, HashAlg = 1)
		{
			return this._Encrypt( p, pp, password, 0, pFileIn, pFileOut, CryptAlg, HashAlg )
		}

		StrEncrypt(string,password,CryptAlg = 1, HashAlg = 1)
		{
			len := StrPutVar(string, str_buf,100,this.StrEncoding)
			if this._Encrypt(str_buf,len, password, 1,0,0,CryptAlg,HashAlg)
				return b64Encode( str_buf, len )
			else
				return ""
		}
	
		StrDecrypt(EncryptedHash,password,CryptAlg = 1, HashAlg = 1)
		{
			if !EncryptedHash
				return ""
			if !len := b64Decode( EncryptedHash, encr_Buf )
				return 0
			if sLen := this._Encrypt(encr_Buf,len, password, 0,0,0,CryptAlg,HashAlg)
			{
				if ( this.StrEncoding = "utf-16" || this.StrEncoding = "cp1200" )
					sLen /= 2
				return strget(&encr_Buf,sLen,this.StrEncoding)
			}
			else
				return ""
		}		
	
		_Encrypt(ByRef encr_Buf,ByRef Buf_Len, password, mode, pFileIn=0, pFileOut=0, CryptAlg = 1,HashAlg = 1)	;mode - 1 encrypt, 0 - decrypt
		{
			c := CryptConst
			;password hashing algorithms
			CUR_PWD_HASH_ALG := HashAlg == 1 || HashAlg = "MD5" ?c.CALG_MD5
												:HashAlg==2 || HashAlg = "MD2" 	?c.CALG_MD2
												:HashAlg==3 || HashAlg = "SHA"	?c.CALG_SHA
												:HashAlg==4 || HashAlg = "SHA256" ?c.CALG_SHA_256	;Vista+ only
												:HashAlg==5 || HashAlg = "SHA384" ?c.CALG_SHA_384	;Vista+ only
												:HashAlg==6 || HashAlg = "SHA512" ?c.CALG_SHA_512	;Vista+ only
												:0
			;encryption algorithms
			CUR_ENC_ALG 	:= CryptAlg==1 || CryptAlg = "RC4" 			? ( c.CALG_RC4, KEY_LENGHT:=0x80 )
											:CryptAlg==2 || CryptAlg = "RC2" 		? ( c.CALG_RC2, KEY_LENGHT:=0x80 )
											:CryptAlg==3 || CryptAlg = "3DES" 		? ( c.CALG_3DES, KEY_LENGHT:=0xC0 )
											:CryptAlg==4 || CryptAlg = "3DES112" ? ( c.CALG_3DES_112, KEY_LENGHT:=0x80 )
											:CryptAlg==5 || CryptAlg = "AES128" 	? ( c.CALG_AES_128, KEY_LENGHT:=0x80 ) ;not supported for win 2000
											:CryptAlg==6 || CryptAlg = "AES192" 	? ( c.CALG_AES_192, KEY_LENGHT:=0xC0 )	;not supported for win 2000
											:CryptAlg==7 || CryptAlg = "AES256" 	? ( c.CALG_AES_256, KEY_LENGHT:=0x100 )	;not supported for win 2000
											:0
			KEY_LENGHT <<= 16
			if (CUR_PWD_HASH_ALG = 0 || CUR_ENC_ALG = 0)
				return 0
			
			if !dllCall("Advapi32\CryptAcquireContextW","Ptr*",hCryptProv,"Uint",0,"Uint",0,"Uint",c.PROV_RSA_AES,"UInt",c.CRYPT_VERIFYCONTEXT)
					{foo := "CryptAcquireContextW", err := GetLastError(), err2 := ErrorLevel
					GoTO FINITA_LA_COMEDIA
					}	
			if !dllCall("Advapi32\CryptCreateHash","Ptr",hCryptProv,"Uint",CUR_PWD_HASH_ALG,"Uint",0,"Uint",0,"Ptr*",hHash )
					{foo := "CryptCreateHash", err := GetLastError(), err2 := ErrorLevel
					GoTO FINITA_LA_COMEDIA
					}
			;hashing password
			passLen := StrPutVar(password, passBuf,0,this.PassEncoding)
			if !dllCall("Advapi32\CryptHashData","Ptr",hHash,"Ptr",&passBuf,"Uint",passLen,"Uint",0 )
					{foo := "CryptHashData", err := GetLastError(), err2 := ErrorLevel
					GoTO FINITA_LA_COMEDIA
					}	
			;getting encryption key from password
			if !dllCall("Advapi32\CryptDeriveKey","Ptr",hCryptProv,"Uint",CUR_ENC_ALG,"Ptr",hHash,"Uint",KEY_LENGHT,"Ptr*",hKey )
					{foo := "CryptDeriveKey", err := GetLastError(), err2 := ErrorLevel
					GoTO FINITA_LA_COMEDIA
					}
			;~ SetKeySalt(hKey,hCryptProv)
			if !dllCall("Advapi32\CryptGetKeyParam","Ptr",hKey,"Uint",c.KP_BLOCKLEN,"Uint*",BlockLen,"Uint*",dwCount := 4,"Uint",0)
					{foo := "CryptGetKeyParam", err := GetLastError(), err2 := ErrorLevel
					GoTO FINITA_LA_COMEDIA
					}	
			BlockLen /= 8
			if (mode == 1)							;Encrypting
			{
				if (pFileIn && pFileOut)			;encrypting file
				{
					ReadBufSize := 10240 - mod(10240,BlockLen==0?1:BlockLen )	;10KB
					pfin := FileOpen(pFileIn,"r","CP0")
					pfout := FileOpen(pFileOut,"w","CP0")
					if !IsObject(pfin)
						{foo := "File Opening " . pFileIn
						GoTO FINITA_LA_COMEDIA
						}
					if !IsObject(pfout)
						{foo := "File Opening " . pFileOut
						GoTO FINITA_LA_COMEDIA
						}
					pfin.Pos := 0
					VarSetCapacity(ReadBuf,ReadBufSize+BlockLen,0)
					isFinal := 0
					hModule := DllCall("LoadLibrary", "Str", "Advapi32.dll","UPtr")
					CryptEnc := DllCall("GetProcAddress", "Ptr", hModule, "AStr", "CryptEncrypt","UPtr")
					while !pfin.AtEOF
					{
						BytesRead := pfin.RawRead(ReadBuf, ReadBufSize)
						if pfin.AtEOF
							isFinal := 1
						if !dllCall(CryptEnc
								,"Ptr",hKey	;key
								,"Ptr",0	;hash
								,"Uint",isFinal	;final
								,"Uint",0	;dwFlags
								,"Ptr",&ReadBuf	;pbdata
								,"Uint*",BytesRead	;dwsize
								,"Uint",ReadBufSize+BlockLen )	;dwbuf		
						{foo := "CryptEncrypt", err := GetLastError(), err2 := ErrorLevel
						GoTO FINITA_LA_COMEDIA
						}	
						pfout.RawWrite(ReadBuf,BytesRead)
						Buf_Len += BytesRead
					}
					DllCall("FreeLibrary", "Ptr", hModule)
					pfin.Close()
					pfout.Close()
				}
				else
				{
					if !dllCall("Advapi32\CryptEncrypt"
								,"Ptr",hKey	;key
								,"Ptr",0	;hash
								,"Uint",1	;final
								,"Uint",0	;dwFlags
								,"Ptr",&encr_Buf	;pbdata
								,"Uint*",Buf_Len	;dwsize
								,"Uint",Buf_Len + BlockLen )	;dwbuf		
					{foo := "CryptEncrypt", err := GetLastError(), err2 := ErrorLevel
					GoTO FINITA_LA_COMEDIA
					}	
				}
			}
			else if (mode == 0)								;decrypting
			{	
				if (pFileIn && pFileOut)					;decrypting file
				{
					ReadBufSize := 10240 - mod(10240,BlockLen==0?1:BlockLen )	;10KB
					pfin := FileOpen(pFileIn,"r","CP0")
					pfout := FileOpen(pFileOut,"w","CP0")
					if !IsObject(pfin)
						{foo := "File Opening " . pFileIn
						GoTO FINITA_LA_COMEDIA
						}
					if !IsObject(pfout)
						{foo := "File Opening " . pFileOut
						GoTO FINITA_LA_COMEDIA
						}
					pfin.Pos := 0
					VarSetCapacity(ReadBuf,ReadBufSize+BlockLen,0)
					isFinal := 0
					hModule := DllCall("LoadLibrary", "Str", "Advapi32.dll","UPtr")
					CryptDec := DllCall("GetProcAddress", "Ptr", hModule, "AStr", "CryptDecrypt","UPtr")
					while !pfin.AtEOF
					{
						BytesRead := pfin.RawRead(ReadBuf, ReadBufSize)
						if pfin.AtEOF
							isFinal := 1
						if !dllCall(CryptDec
								,"Ptr",hKey	;key
								,"Ptr",0	;hash
								,"Uint",isFinal	;final
								,"Uint",0	;dwFlags
								,"Ptr",&ReadBuf	;pbdata
								,"Uint*",BytesRead )	;dwsize
						{foo := "CryptDecrypt", err := GetLastError(), err2 := ErrorLevel
						GoTO FINITA_LA_COMEDIA
						}	
						pfout.RawWrite(ReadBuf,BytesRead)
						Buf_Len += BytesRead
					}
					DllCall("FreeLibrary", "Ptr", hModule)
					pfin.Close()
					pfout.Close()
					
				}
				else if !dllCall("Advapi32\CryptDecrypt"
								,"Ptr",hKey	;key
								,"Ptr",0	;hash
								,"Uint",1	;final
								,"Uint",0	;dwFlags
								,"Ptr",&encr_Buf	;pbdata
								,"Uint*",Buf_Len )	;dwsize
					{foo := "CryptDecrypt", err := GetLastError(), err2 := ErrorLevel
					GoTO FINITA_LA_COMEDIA
					}	
			}
FINITA_LA_COMEDIA:
			dllCall("Advapi32\CryptDestroyKey","Ptr",hKey )
			dllCall("Advapi32\CryptDestroyHash","Ptr",hHash)
			dllCall("Advapi32\CryptReleaseContext","Ptr",hCryptProv,"UInt",0)
			if (A_ThisLabel = "FINITA_LA_COMEDIA")
			{
				if (A_IsCompiled = 1)
					return ""
				else
					msgbox % foo " call failed with:`nErrorLevel: " err2 "`nLastError: " err "`n" ErrorFormat(err) 
				return ""
			}
			return Buf_Len
		}
	}
	
	class Hash
	{
		static StrEncoding := "CP0"
		static PassEncoding := "UTF-16"
		
		FileHash(pFile,HashAlg = 1,pwd = "",hmac_alg = 1)
		{
			return this._CalcHash(p,pp,pFile,HashAlg,pwd,hmac_alg)
		}
		
		StrHash(string,HashAlg = 1,pwd = "",hmac_alg = 1)		;strType 1 for ASC, 0 for UTF
		{
			buf_len := StrPutVar(string, buf,0,this.StrEncoding)
			return this._CalcHash(buf,buf_len,0,HashAlg,pwd,hmac_alg)
		}
		
		_CalcHash(ByRef bBuffer,BufferLen,pFile,HashAlg = 1,pwd = "",hmac_alg = 1)
		{
			c := CryptConst
			;password hashing algorithms
			HASH_ALG := HashAlg==1?c.CALG_MD5
						:HashAlg==2?c.CALG_MD2
						:HashAlg==3?c.CALG_SHA
						:HashAlg==4?c.CALG_SHA_256	;Vista+ only
						:HashAlg==5?c.CALG_SHA_384	;Vista+ only
						:HashAlg==6?c.CALG_SHA_512	;Vista+ only
						:0
			;encryption algorithms
			HMAC_KEY_ALG 	:= hmac_alg==1?c.CALG_RC4
								:hmac_alg==2?c.CALG_RC2
								:hmac_alg==3?c.CALG_3DES
								:hmac_alg==4?c.CALG_3DES_112
								:hmac_alg==5?c.CALG_AES_128 ;not supported for win 2000
								:hmac_alg==6?c.CALG_AES_192	;not supported for win 2000
								:hmac_alg==7?c.CALG_AES_256	;not supported for win 2000
								:0
			KEY_LENGHT 		:= hmac_alg==1?0x80
								:hmac_alg==2?0x80
								:hmac_alg==3?0xC0
								:hmac_alg==4?0x80
								:hmac_alg==5?0x80
								:hmac_alg==6?0xC0
								:hmac_alg==7?0x100
								:0
			KEY_LENGHT <<= 16
			if (!HASH_ALG || !HMAC_KEY_ALG)
				return 0
			if !dllCall("Advapi32\CryptAcquireContextW","Ptr*",hCryptProv,"Uint",0,"Uint",0,"Uint",c.PROV_RSA_AES,"UInt",c.CRYPT_VERIFYCONTEXT )
				{foo := "CryptAcquireContextW", err := GetLastError(), err2 := ErrorLevel
				GoTO FINITA_DA_COMEDIA
				}	
			if !dllCall("Advapi32\CryptCreateHash","Ptr",hCryptProv,"Uint",HASH_ALG,"Uint",0,"Uint",0,"Ptr*",hHash )
				{foo := "CryptCreateHash1", err := GetLastError(), err2 := ErrorLevel
				GoTO FINITA_DA_COMEDIA
				}
			
			if (pwd != "")			;going HMAC
			{
				passLen := StrPutVar(pwd, passBuf,0,this.PassEncoding)
				if !dllCall("Advapi32\CryptHashData","Ptr",hHash,"Ptr",&passBuf,"Uint",passLen,"Uint",0 )
					{foo := "CryptHashData Pwd", err := GetLastError(), err2 := ErrorLevel
					GoTO FINITA_DA_COMEDIA
					}
				;getting encryption key from password
				if !dllCall("Advapi32\CryptDeriveKey","Ptr",hCryptProv,"Uint",HMAC_KEY_ALG,"Ptr",hHash,"Uint",KEY_LENGHT,"Ptr*",hKey )
					{foo := "CryptDeriveKey Pwd", err := GetLastError(), err2 := ErrorLevel
					GoTO FINITA_DA_COMEDIA
					}
				dllCall("Advapi32\CryptDestroyHash","Ptr",hHash)
				if !dllCall("Advapi32\CryptCreateHash","Ptr",hCryptProv,"Uint",c.CALG_HMAC,"Ptr",hKey,"Uint",0,"Ptr*",hHash )
					{foo := "CryptCreateHash2", err := GetLastError(), err2 := ErrorLevel
					GoTO FINITA_DA_COMEDIA
					}
				VarSetCapacity(HmacInfoStruct,4*A_PtrSize + 4,0)
				NumPut(HASH_ALG,HmacInfoStruct,0,"UInt")
				if !dllCall("Advapi32\CryptSetHashParam","Ptr",hHash,"Uint",c.HP_HMAC_INFO,"Ptr",&HmacInfoStruct,"Uint",0)
					{foo := "CryptSetHashParam", err := GetLastError(), err2 := ErrorLevel
					GoTO FINITA_DA_COMEDIA
					}
			}
				
			if pFile
			{
				f := FileOpen(pFile,"r","CP0")
				BUFF_SIZE := 1024 * 1024 ; 1 MB
				if !IsObject(f)
					{foo := "File Opening"
					GoTO FINITA_DA_COMEDIA
					}
				if !hModule := DllCall( "GetModuleHandleW", "str", "Advapi32.dll", "UPtr" )
					hModule := DllCall( "LoadLibraryW", "str", "Advapi32.dll", "UPtr" )
				hCryptHashData := DllCall("GetProcAddress", "Ptr", hModule, "AStr", "CryptHashData", "UPtr")
				VarSetCapacity(read_buf,BUFF_SIZE,0)
				f.Pos := 0
				While (cbCount := f.RawRead(read_buf, BUFF_SIZE))
				{
					if (cbCount = 0)
						break
					if !dllCall(hCryptHashData
								,"Ptr",hHash
								,"Ptr",&read_buf
								,"Uint",cbCount
								,"Uint",0 )
						{foo := "CryptHashData", err := GetLastError(), err2 := ErrorLevel
						GoTO FINITA_DA_COMEDIA
						}
				}
				f.Close()
			}
			else
			{
				if !dllCall("Advapi32\CryptHashData"
							,"Ptr",hHash
							,"Ptr",&bBuffer
							,"Uint",BufferLen
							,"Uint",0 )
					{foo := "CryptHashData", err := GetLastError(), err2 := ErrorLevel
					GoTO FINITA_DA_COMEDIA
					}
			}
			if !dllCall("Advapi32\CryptGetHashParam","Ptr",hHash,"Uint",c.HP_HASHSIZE,"Uint*",HashLen,"Uint*",HashLenSize := 4,"UInt",0 )
				{foo := "CryptGetHashParam HP_HASHSIZE", err := GetLastError(), err2 := ErrorLevel
				GoTO FINITA_DA_COMEDIA
				}
			VarSetCapacity(pbHash,HashLen,0)
			if !dllCall("Advapi32\CryptGetHashParam","Ptr",hHash,"Uint",c.HP_HASHVAL,"Ptr",&pbHash,"Uint*",HashLen,"UInt",0 )
				{foo := "CryptGetHashParam HP_HASHVAL", err := GetLastError(), err2 := ErrorLevel
				GoTO FINITA_DA_COMEDIA
				}
			hashval := b2a_hex( pbHash, HashLen )
				
		FINITA_DA_COMEDIA:
			DllCall("FreeLibrary", "Ptr", hModule)
			dllCall("Advapi32\CryptDestroyHash","Ptr",hHash)
			dllCall("Advapi32\CryptDestroyKey","Ptr",hKey )
			dllCall("Advapi32\CryptReleaseContext","Ptr",hCryptProv,"UInt",0)
			if (A_ThisLabel = "FINITA_LA_COMEDIA")
			{
				if (A_IsCompiled = 1)
					return ""
				else
					msgbox % foo " call failed with:`nErrorLevel: " err2 "`nLastError: " err "`n" ErrorFormat(err) 
				return 0
			}
			return hashval
		}
	}
}

;returns positive hex value of last error
GetLastError()
{
	return ToHex(A_LastError < 0 ? A_LastError & 0xFFFFFFFF : A_LastError)
}

;converting decimal to hex value
ToHex(num)
{
	if num is not integer
		return num
	oldFmt := A_FormatInteger
	SetFormat, integer, hex
	num := num + 0
	SetFormat, integer,% oldFmt
	return num
}

;And this function returns error description based on error number passed. ;
;Error number is one returned by GetLastError() or from A_LastError
ErrorFormat(error_id)
{
	VarSetCapacity(msg,1000,0)
	if !len := DllCall("FormatMessageW"
				,"UInt",FORMAT_MESSAGE_FROM_SYSTEM := 0x00001000 | FORMAT_MESSAGE_IGNORE_INSERTS := 0x00000200		;dwflags
				,"Ptr",0		;lpSource
				,"UInt",error_id	;dwMessageId
				,"UInt",0			;dwLanguageId
				,"Ptr",&msg			;lpBuffer
				,"UInt",500)			;nSize
		return
	return 	strget(&msg,len)
}

StrPutVar(string, ByRef var, addBufLen = 0,encoding="UTF-16")
{
	; Ensure capacity.
	; StrPut returns char count, but VarSetCapacity needs bytes.
	tlen := ((encoding="utf-16"||encoding="cp1200") ? 2 : 1)
	str_len := StrPut(string, encoding) * tlen
    VarSetCapacity( var, str_len + addBufLen,0 )
    ; Copy or convert the string.
	StrPut( string, &var, encoding )
    return str_len - tlen
}

SetKeySalt(hKey,hProv)
{
	KP_SALT_EX := 10
	SALT := "89ABF9C1005EDD40"
	;~ len := HashToByte(SALT,pb)
	VarSetCapacity(st,2*A_PtrSize,0)
	NumPut(len,st,0,"UInt")
	NumPut(&pb,st,A_PtrSize,"UPtr")
	if !dllCall("Advapi32\CryptSetKeyParam"
				,"Ptr",hKey
				,"Uint",KP_SALT_EX
				,"Ptr",&st
				,"Uint",0)
		msgbox % ErrorFormat(GetLastError())
}

GetKeySalt(hKey)
{
	KP_IV := 1       ; Initialization vector
	KP_SALT := 2       ; Salt value
	if !dllCall("Advapi32\CryptGetKeyParam"
				,"Ptr",hKey
				,"Uint",KP_SALT
				,"Uint",0
				,"Uint*",dwCount
				,"Uint",0)
	msgbox % "Fail to get SALT length."
	msgbox % "SALT length.`n" dwCount
	VarSetCapacity(pb,dwCount,0)
	if !dllCall("Advapi32\CryptGetKeyParam"
				,"Ptr",hKey
				,"Uint",KP_SALT
				,"Ptr",&pb
				,"Uint*",dwCount
				,"Uint",0)
	msgbox % "Fail to get SALT"	
	;~ msgbox % ByteToHash(pb,dwCount) "`n" dwCount
}

class CryptConst
{
static ALG_CLASS_ANY := (0)
static ALG_CLASS_SIGNATURE := (1 << 13)
static ALG_CLASS_MSG_ENCRYPT := (2 << 13)
static ALG_CLASS_DATA_ENCRYPT := (3 << 13)
static ALG_CLASS_HASH := (4 << 13)
static ALG_CLASS_KEY_EXCHANGE := (5 << 13)
static ALG_CLASS_ALL := (7 << 13)
static ALG_TYPE_ANY := (0)
static ALG_TYPE_DSS := (1 << 9)
static ALG_TYPE_RSA := (2 << 9)
static ALG_TYPE_BLOCK := (3 << 9)
static ALG_TYPE_STREAM := (4 << 9)
static ALG_TYPE_DH := (5 << 9)
static ALG_TYPE_SECURECHANNEL := (6 << 9)
static ALG_SID_ANY := (0)
static ALG_SID_RSA_ANY := 0
static ALG_SID_RSA_PKCS := 1
static ALG_SID_RSA_MSATWORK := 2
static ALG_SID_RSA_ENTRUST := 3
static ALG_SID_RSA_PGP := 4
static ALG_SID_DSS_ANY := 0
static ALG_SID_DSS_PKCS := 1
static ALG_SID_DSS_DMS := 2
static ALG_SID_ECDSA := 3
static ALG_SID_DES := 1
static ALG_SID_3DES := 3
static ALG_SID_DESX := 4
static ALG_SID_IDEA := 5
static ALG_SID_CAST := 6
static ALG_SID_SAFERSK64 := 7
static ALG_SID_SAFERSK128 := 8
static ALG_SID_3DES_112 := 9
static ALG_SID_CYLINK_MEK := 12
static ALG_SID_RC5 := 13
static ALG_SID_AES_128 := 14
static ALG_SID_AES_192 := 15
static ALG_SID_AES_256 := 16
static ALG_SID_AES := 17
static ALG_SID_SKIPJACK := 10
static ALG_SID_TEK := 11
static CRYPT_MODE_CBCI := 6       ; ANSI CBC Interleaved
static CRYPT_MODE_CFBP := 7       ; ANSI CFB Pipelined
static CRYPT_MODE_OFBP := 8       ; ANSI OFB Pipelined
static CRYPT_MODE_CBCOFM := 9       ; ANSI CBC + OF Masking
static CRYPT_MODE_CBCOFMI := 10      ; ANSI CBC + OFM Interleaved
static ALG_SID_RC2 := 2
static ALG_SID_RC4 := 1
static ALG_SID_SEAL := 2
static ALG_SID_DH_SANDF := 1
static ALG_SID_DH_EPHEM := 2
static ALG_SID_AGREED_KEY_ANY := 3
static ALG_SID_KEA := 4
static ALG_SID_ECDH := 5
static ALG_SID_MD2 := 1
static ALG_SID_MD4 := 2
static ALG_SID_MD5 := 3
static ALG_SID_SHA := 4
static ALG_SID_SHA1 := 4
static ALG_SID_MAC := 5
static ALG_SID_RIPEMD := 6
static ALG_SID_RIPEMD160 := 7
static ALG_SID_SSL3SHAMD5 := 8
static ALG_SID_HMAC := 9
static ALG_SID_TLS1PRF := 10
static ALG_SID_HASH_REPLACE_OWF := 11
static ALG_SID_SHA_256 := 12
static ALG_SID_SHA_384 := 13
static ALG_SID_SHA_512 := 14
static ALG_SID_SSL3_MASTER := 1
static ALG_SID_SCHANNEL_MASTER_HASH := 2
static ALG_SID_SCHANNEL_MAC_KEY := 3
static ALG_SID_PCT1_MASTER := 4
static ALG_SID_SSL2_MASTER := 5
static ALG_SID_TLS1_MASTER := 6
static ALG_SID_SCHANNEL_ENC_KEY := 7
static ALG_SID_ECMQV := 1
static ALG_SID_EXAMPLE := 80
static CALG_MD2 := (CryptConst.ALG_CLASS_HASH | CryptConst.ALG_TYPE_ANY | CryptConst.ALG_SID_MD2)
static CALG_MD4 := (CryptConst.ALG_CLASS_HASH | CryptConst.ALG_TYPE_ANY | CryptConst.ALG_SID_MD4)
static CALG_MD5 := (CryptConst.ALG_CLASS_HASH | CryptConst.ALG_TYPE_ANY | CryptConst.ALG_SID_MD5)
static CALG_SHA := (CryptConst.ALG_CLASS_HASH | CryptConst.ALG_TYPE_ANY | CryptConst.ALG_SID_SHA)
static CALG_SHA1 := (CryptConst.ALG_CLASS_HASH | CryptConst.ALG_TYPE_ANY | CryptConst.ALG_SID_SHA1)
static CALG_MAC := (CryptConst.ALG_CLASS_HASH | CryptConst.ALG_TYPE_ANY | CryptConst.ALG_SID_MAC)
static CALG_RSA_SIGN := (CryptConst.ALG_CLASS_SIGNATURE | CryptConst.ALG_TYPE_RSA | CryptConst.ALG_SID_RSA_ANY)
static CALG_DSS_SIGN := (CryptConst.ALG_CLASS_SIGNATURE | CryptConst.ALG_TYPE_DSS | CryptConst.ALG_SID_DSS_ANY)
static CALG_NO_SIGN := (CryptConst.ALG_CLASS_SIGNATURE | CryptConst.ALG_TYPE_ANY | CryptConst.ALG_SID_ANY)
static CALG_RSA_KEYX := (CryptConst.ALG_CLASS_KEY_EXCHANGE|CryptConst.ALG_TYPE_RSA|CryptConst.ALG_SID_RSA_ANY)
static CALG_DES := (CryptConst.ALG_CLASS_DATA_ENCRYPT|CryptConst.ALG_TYPE_BLOCK|CryptConst.ALG_SID_DES)
static CALG_3DES_112 := (CryptConst.ALG_CLASS_DATA_ENCRYPT|CryptConst.ALG_TYPE_BLOCK|CryptConst.ALG_SID_3DES_112)
static CALG_3DES := (CryptConst.ALG_CLASS_DATA_ENCRYPT|CryptConst.ALG_TYPE_BLOCK|CryptConst.ALG_SID_3DES)
static CALG_DESX := (CryptConst.ALG_CLASS_DATA_ENCRYPT|CryptConst.ALG_TYPE_BLOCK|CryptConst.ALG_SID_DESX)
static CALG_RC2 := (CryptConst.ALG_CLASS_DATA_ENCRYPT|CryptConst.ALG_TYPE_BLOCK|CryptConst.ALG_SID_RC2)
static CALG_RC4 := (CryptConst.ALG_CLASS_DATA_ENCRYPT|CryptConst.ALG_TYPE_STREAM|CryptConst.ALG_SID_RC4)
static CALG_SEAL := (CryptConst.ALG_CLASS_DATA_ENCRYPT|CryptConst.ALG_TYPE_STREAM|CryptConst.ALG_SID_SEA)
static CALG_DH_SF := (CryptConst.ALG_CLASS_KEY_EXCHANGE|CryptConst.ALG_TYPE_DH|CryptConst.ALG_SID_DH_SANDF)
static CALG_DH_EPHEM := (CryptConst.ALG_CLASS_KEY_EXCHANGE|CryptConst.ALG_TYPE_DH|CryptConst.ALG_SID_DH_EPHEM)
static CALG_AGREEDKEY_ANY := (CryptConst.ALG_CLASS_KEY_EXCHANGE|CryptConst.ALG_TYPE_DH|CryptConst.ALG_SID_AGREED_KEY_ANY)
static CALG_KEA_KEYX := (CryptConst.ALG_CLASS_KEY_EXCHANGE|CryptConst.ALG_TYPE_DH|CryptConst.ALG_SID_KEA)
static CALG_HUGHES_MD5 := (CryptConst.ALG_CLASS_KEY_EXCHANGE|CryptConst.ALG_TYPE_ANY|CryptConst.ALG_SID_MD5)
static CALG_SKIPJACK := (CryptConst.ALG_CLASS_DATA_ENCRYPT|CryptConst.ALG_TYPE_BLOCK|CryptConst.ALG_SID_SKIPJACK)
static CALG_TEK := (CryptConst.ALG_CLASS_DATA_ENCRYPT|CryptConst.ALG_TYPE_BLOCK|CryptConst.ALG_SID_TEK)
static CALG_CYLINK_MEK := (CryptConst.ALG_CLASS_DATA_ENCRYPT|CryptConst.ALG_TYPE_BLOCK|CryptConst.ALG_SID_CYLINK_MEK)
static CALG_SSL3_SHAMD5 := (CryptConst.ALG_CLASS_HASH | CryptConst.ALG_TYPE_ANY | CryptConst.ALG_SID_SSL3SHAMD5)
static CALG_SSL3_MASTER := (CryptConst.ALG_CLASS_MSG_ENCRYPT|CryptConst.ALG_TYPE_SECURECHANNEL|CryptConst.ALG_SID_SSL3_MASTER)
static CALG_SCHANNEL_MASTER_HASH := (CryptConst.ALG_CLASS_MSG_ENCRYPT|CryptConst.ALG_TYPE_SECURECHANNEL|CryptConst.ALG_SID_SCHANNEL_MASTER_HASH)
static CALG_SCHANNEL_MAC_KEY := (CryptConst.ALG_CLASS_MSG_ENCRYPT|CryptConst.ALG_TYPE_SECURECHANNEL|CryptConst.ALG_SID_SCHANNEL_MAC_KEY)
static CALG_SCHANNEL_ENC_KEY := (CryptConst.ALG_CLASS_MSG_ENCRYPT|CryptConst.ALG_TYPE_SECURECHANNEL|CryptConst.ALG_SID_SCHANNEL_ENC_KEY)
static CALG_PCT1_MASTER := (CryptConst.ALG_CLASS_MSG_ENCRYPT|CryptConst.ALG_TYPE_SECURECHANNEL|CryptConst.ALG_SID_PCT1_MASTER)
static CALG_SSL2_MASTER := (CryptConst.ALG_CLASS_MSG_ENCRYPT|CryptConst.ALG_TYPE_SECURECHANNEL|CryptConst.ALG_SID_SSL2_MASTER)
static CALG_TLS1_MASTER := (CryptConst.ALG_CLASS_MSG_ENCRYPT|CryptConst.ALG_TYPE_SECURECHANNEL|CryptConst.ALG_SID_TLS1_MASTER)
static CALG_RC5 := (CryptConst.ALG_CLASS_DATA_ENCRYPT|CryptConst.ALG_TYPE_BLOCK|CryptConst.ALG_SID_RC5)
static CALG_HMAC := (CryptConst.ALG_CLASS_HASH | CryptConst.ALG_TYPE_ANY | CryptConst.ALG_SID_HMAC)
static CALG_TLS1PRF := (CryptConst.ALG_CLASS_HASH | CryptConst.ALG_TYPE_ANY | CryptConst.ALG_SID_TLS1PRF)
static CALG_HASH_REPLACE_OWF := (CryptConst.ALG_CLASS_HASH | CryptConst.ALG_TYPE_ANY | CryptConst.ALG_SID_HASH_REPLACE_OWF)
static CALG_AES_128 := (CryptConst.ALG_CLASS_DATA_ENCRYPT|CryptConst.ALG_TYPE_BLOCK|CryptConst.ALG_SID_AES_128)
static CALG_AES_192 := (CryptConst.ALG_CLASS_DATA_ENCRYPT|CryptConst.ALG_TYPE_BLOCK|CryptConst.ALG_SID_AES_192)
static CALG_AES_256 := (CryptConst.ALG_CLASS_DATA_ENCRYPT|CryptConst.ALG_TYPE_BLOCK|CryptConst.ALG_SID_AES_256)
static CALG_AES := (CryptConst.ALG_CLASS_DATA_ENCRYPT|CryptConst.ALG_TYPE_BLOCK|CryptConst.ALG_SID_AES)
static CALG_SHA_256 := (CryptConst.ALG_CLASS_HASH | CryptConst.ALG_TYPE_ANY | CryptConst.ALG_SID_SHA_256)
static CALG_SHA_384 := (CryptConst.ALG_CLASS_HASH | CryptConst.ALG_TYPE_ANY | CryptConst.ALG_SID_SHA_384)
static CALG_SHA_512 := (CryptConst.ALG_CLASS_HASH | CryptConst.ALG_TYPE_ANY | CryptConst.ALG_SID_SHA_512)
static CALG_ECDH := (CryptConst.ALG_CLASS_KEY_EXCHANGE | CryptConst.ALG_TYPE_DH | CryptConst.ALG_SID_ECDH)
static CALG_ECMQV := (CryptConst.ALG_CLASS_KEY_EXCHANGE | CryptConst.ALG_TYPE_ANY | CryptConst.ALG_SID_ECMQV)
static CALG_ECDSA := (CryptConst.ALG_CLASS_SIGNATURE | CryptConst.ALG_TYPE_DSS | CryptConst.ALG_SID_ECDSA)
static CRYPT_VERIFYCONTEXT := 0xF0000000
static CRYPT_NEWKEYSET := 0x00000008
static CRYPT_DELETEKEYSET := 0x00000010
static CRYPT_MACHINE_KEYSET := 0x00000020
static CRYPT_SILENT := 0x00000040
static CRYPT_DEFAULT_CONTAINER_OPTIONAL := 0x00000080
static CRYPT_EXPORTABLE := 0x00000001
static CRYPT_USER_PROTECTED := 0x00000002
static CRYPT_CREATE_SALT := 0x00000004
static CRYPT_UPDATE_KEY := 0x00000008
static CRYPT_NO_SALT := 0x00000010
static CRYPT_PREGEN := 0x00000040
static CRYPT_RECIPIENT := 0x00000010
static CRYPT_INITIATOR := 0x00000040
static CRYPT_ONLINE := 0x00000080
static CRYPT_SF := 0x00000100
static CRYPT_CREATE_IV := 0x00000200
static CRYPT_KEK := 0x00000400
static CRYPT_DATA_KEY := 0x00000800
static CRYPT_VOLATILE := 0x00001000
static CRYPT_SGCKEY := 0x00002000
static CRYPT_ARCHIVABLE := 0x00004000
static CRYPT_FORCE_KEY_PROTECTION_HIGH := 0x00008000
static RSA1024BIT_KEY := 0x04000000
static CRYPT_SERVER := 0x00000400
static KEY_LENGTH_MASK := 0xFFFF0000
static CRYPT_Y_ONLY := 0x00000001
static CRYPT_SSL2_FALLBACK := 0x00000002
static CRYPT_DESTROYKEY := 0x00000004
static CRYPT_OAEP := 0x00000040  ; used with RSA encryptions/decryptions
static CRYPT_BLOB_VER3 := 0x00000080  ; export version 3 of a blob type
static CRYPT_IPSEC_HMAC_KEY := 0x00000100  ; CryptImportKey only
static CRYPT_DECRYPT_RSA_NO_PADDING_CHECK := 0x00000020
static CRYPT_SECRETDIGEST := 0x00000001
static CRYPT_OWF_REPL_LM_HASH := 0x00000001  ; this is only for the OWF replacement CSP
static CRYPT_LITTLE_ENDIAN := 0x00000001
static CRYPT_NOHASHOID := 0x00000001
static CRYPT_TYPE2_FORMAT := 0x00000002
static CRYPT_X931_FORMAT := 0x00000004
static CRYPT_MACHINE_DEFAULT := 0x00000001
static CRYPT_USER_DEFAULT := 0x00000002
static CRYPT_DELETE_DEFAULT := 0x00000004
static SIMPLEBLOB := 0x1
static PUBLICKEYBLOB := 0x6
static PRIVATEKEYBLOB := 0x7
static PLAINTEXTKEYBLOB := 0x8
static OPAQUEKEYBLOB := 0x9
static PUBLICKEYBLOBEX := 0xA
static SYMMETRICWRAPKEYBLOB := 0xB
static KEYSTATEBLOB := 0xC
static AT_KEYEXCHANGE := 1
static AT_SIGNATURE := 2
static CRYPT_USERDATA := 1
static KP_IV := 1       ; Initialization vector
static KP_SALT := 2       ; Salt value
static KP_PADDING := 3       ; Padding values
static KP_MODE := 4       ; Mode of the cipher
static KP_MODE_BITS := 5       ; Number of bits to feedback
static KP_PERMISSIONS := 6       ; Key permissions DWORD
static KP_ALGID := 7       ; Key algorithm
static KP_BLOCKLEN := 8       ; Block size of the cipher
static KP_KEYLEN := 9       ; Length of key in bits
static KP_SALT_EX := 10      ; Length of salt in bytes
static KP_P := 11      ; DSS/Diffie-Hellman P value
static KP_G := 12      ; DSS/Diffie-Hellman G value
static KP_Q := 13      ; DSS Q value
static KP_X := 14      ; Diffie-Hellman X value
static KP_Y := 15      ; Y value
static KP_RA := 16      ; Fortezza RA value
static KP_RB := 17      ; Fortezza RB value
static KP_INFO := 18      ; for putting information into an RSA envelope
static KP_EFFECTIVE_KEYLEN := 19      ; setting and getting RC2 effective key length
static KP_SCHANNEL_ALG := 20      ; for setting the Secure Channel algorithms
static KP_CLIENT_RANDOM := 21      ; for setting the Secure Channel client random data
static KP_SERVER_RANDOM := 22      ; for setting the Secure Channel server random data
static KP_RP := 23
static KP_PRECOMP_MD5 := 24
static KP_PRECOMP_SHA := 25
static KP_CERTIFICATE := 26      ; for setting Secure Channel certificate data (PCT1)
static KP_CLEAR_KEY := 27      ; for setting Secure Channel clear key data (PCT1)
static KP_PUB_EX_LEN := 28
static KP_PUB_EX_VAL := 29
static KP_KEYVAL := 30
static KP_ADMIN_PIN := 31
static KP_KEYEXCHANGE_PIN := 32
static KP_SIGNATURE_PIN := 33
static KP_PREHASH := 34
static KP_ROUNDS := 35
static KP_OAEP_PARAMS := 36      ; for setting OAEP params on RSA keys
static KP_CMS_KEY_INFO := 37
static KP_CMS_DH_KEY_INFO := 38
static KP_PUB_PARAMS := 39      ; for setting public parameters
static KP_VERIFY_PARAMS := 40      ; for verifying DSA and DH parameters
static KP_HIGHEST_VERSION := 41      ; for TLS protocol version setting
static KP_GET_USE_COUNT := 42      ; for use with PP_CRYPT_COUNT_KEY_USE contexts
static KP_PIN_ID := 43
static KP_PIN_INFO := 44
static HP_ALGID := 0x0001  ; Hash algorithm
static HP_HASHVAL := 0x0002  ; Hash value
static HP_HASHSIZE := 0x0004  ; Hash value size
static HP_HMAC_INFO := 0x0005  ; information for creating an HMAC
static HP_TLS1PRF_LABEL := 0x0006  ; label for TLS1 PRF
static HP_TLS1PRF_SEED := 0x0007  ; seed for TLS1 PRF
static PROV_RSA_FULL := 1
static PROV_RSA_SIG := 2
static PROV_DSS := 3
static PROV_FORTEZZA := 4
static PROV_MS_EXCHANGE := 5
static PROV_SSL := 6
static PROV_RSA_SCHANNEL := 12
static PROV_DSS_DH := 13
static PROV_EC_ECDSA_SIG := 14
static PROV_EC_ECNRA_SIG := 15
static PROV_EC_ECDSA_FULL := 16
static PROV_EC_ECNRA_FULL := 17
static PROV_DH_SCHANNEL := 18
static PROV_SPYRUS_LYNKS := 20
static PROV_RNG := 21
static PROV_INTEL_SEC := 22
static PROV_REPLACE_OWF := 23
static PROV_RSA_AES := 24
static PROV_STT_MER := 7
static PROV_STT_ACQ := 8
static PROV_STT_BRND := 9
static PROV_STT_ROOT := 10
static PROV_STT_ISS := 11
}

b64Encode( ByRef buf, bufLen )
{
	DllCall( "crypt32\CryptBinaryToStringA", "ptr", &buf, "UInt", bufLen, "Uint", 1 | 0x40000000, "Ptr", 0, "UInt*", outLen )
	VarSetCapacity( outBuf, outLen, 0 )
	DllCall( "crypt32\CryptBinaryToStringA", "ptr", &buf, "UInt", bufLen, "Uint", 1 | 0x40000000, "Ptr", &outBuf, "UInt*", outLen )
	return strget( &outBuf, outLen, "CP0" )
}

b64Decode( b64str, ByRef outBuf )
{
   static CryptStringToBinary := "crypt32\CryptStringToBinary" (A_IsUnicode ? "W" : "A")

   DllCall( CryptStringToBinary, "ptr", &b64str, "UInt", 0, "Uint", 1, "Ptr", 0, "UInt*", outLen, "ptr", 0, "ptr", 0 )
   VarSetCapacity( outBuf, outLen, 0 )
   DllCall( CryptStringToBinary, "ptr", &b64str, "UInt", 0, "Uint", 1, "Ptr", &outBuf, "UInt*", outLen, "ptr", 0, "ptr", 0 )

   return outLen
}

b2a_hex( ByRef pbData, dwLen )
{
	if (dwLen < 1)
		return 0
	if pbData is integer
		ptr := pbData
	else
		ptr := &pbData
	SetFormat,integer,Hex
	loop,%dwLen%
	{
		num := numget(ptr+0,A_index-1,"UChar")
		hash .= substr((num >> 4),0) . substr((num & 0xf),0)
	}
	SetFormat,integer,D
	StringLower,hash,hash
	return hash
}

a2b_hex( sHash,ByRef ByteBuf )
{
	if (sHash == "" || RegExMatch(sHash,"[^\dABCDEFabcdef]") || mod(StrLen(sHash),2))
		return 0
	BufLen := StrLen(sHash)/2
	VarSetCapacity(ByteBuf,BufLen,0)
	loop,%BufLen%
	{
		num1 := (p := "0x" . SubStr(sHash,(A_Index-1)*2+1,1)) << 4
		num2 := "0x" . SubStr(sHash,(A_Index-1)*2+2,1)
		num := num1 | num2
		NumPut(num,ByteBuf,A_Index-1,"UChar")
	}
	return BufLen
}

Free(byRef var)
{
  VarSetCapacity(var,0)
  return
}

MinClick(title, xcord, ycord, nwidth, nheight, button:="left")
{
SetControlDelay, -1
SysGet, SM_CYSIZE, 31	
SysGet, SM_CYEDGE, 46	
SysGet, SM_CXEDGE, 45
SysGet, SM_CXSIZE, 30
titleHeight := SM_CYSIZE + SM_CYEDGE
titleWidth := SM_CXEDGE + SM_CXSIZE

Buttony = %ycord%
Buttonx = %xcord%

WinGetPos,,,width,height, %title%
	if (height = nheight && width = nwidth)
		{
			Y := Buttony	
			X := Buttonx
		}
	  else
		{
			Y := Buttony - titleHeight	
			X := Buttonx - titleWidth
		}
	ControlClick, X%X% Y%Y%, %title%,, %button%
}
return
