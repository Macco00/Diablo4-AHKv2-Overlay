global dirIni := A_WorkingDir . "\settings.ini"
global dirImage := A_WorkingDir . "\Image.jpg"
global dirBoot := A_WorkingDir . "\boot.cmd"
global prev := "false"
global flag := "false"
A_HotkeyInterval := 2000  ; This is the default value (milliseconds).
A_MaxHotkeysPerInterval := 2
global resolution := 0
global hudconfig := 0
global prevRes := 0
global skill1 := 0
global skill2 := 0
global skill3 := 0
global skill4 := 0
global skillLeft := 0
global skillRight := 0
global posX := 0
global posY := 0
global size := 0
global opacity := 0
global health := 0
global resource := 0
global toggle := 0
global potion := 0
global dash := 0
global mapShow := 0
global OTRpath := 0
global dirRoot := "cd " . OTRpath


Loop 1
{
	; Load ini, loop if it doesn't exist
	if FileExist("settings.ini")
	{
		global OTRpath
		global dirRoot
		
		; [General]
		resolution := 	IniRead(dirIni, "General", "Resolution")
		hudconfig := 	IniRead(dirIni, "General", "HUD Config")
		prevRes := 	IniRead(dirIni, "General", "PrevResolution")
		; [Skills]
		skill1 := 	IniRead(dirIni, "Skills", "Skill1")
		skill2 := 	IniRead(dirIni, "Skills", "Skill2")
		skill3 := 	IniRead(dirIni, "Skills", "Skill3")
		skill4 := 	IniRead(dirIni, "Skills", "Skill4")
		skillLeft := 	IniRead(dirIni, "Skills", "SkillLeft")
		skillRight := 	IniRead(dirIni, "Skills", "SkillRight")
		posX := 	IniRead(dirIni, "Skills", "PosX")
		posY := 	IniRead(dirIni, "Skills", "PosY")
		size := 	IniRead(dirIni, "Skills", "Size")
		opacity := 	IniRead(dirIni, "Skills", "Opacity")
		; [Bubbles]
		health :=	IniRead(dirIni, "Bubbles", "Health")
		resource := 	IniRead(dirIni, "Bubbles", "Resource")
		toggle := 	IniRead(dirIni, "Bubbles", "Toggle")
		; [Extra]
		potion :=	IniRead(dirIni, "Extra", "Potion")
		dash := 	IniRead(dirIni, "Extra", "Dash")
		mapShow := 		IniRead(dirIni, "Extra", "Map")
		OTRpath := 		IniRead(dirIni, "Extra", "OTRpath")

		dirRoot := "cd " . OTRpath
	
	}
	; Creates an ini file with everything off, loop copies values to the variables
	else
	{
		FileAppend "[General]`n", "settings.ini", "UTF-16-RAW"
		FileAppend "Resolution=0`n", "settings.ini", "UTF-16-RAW"
		FileAppend "HUD Config=0`n", "settings.ini", "UTF-16-RAW"
		FileAppend "PrevResolution=0`n", "settings.ini", "UTF-16-RAW"
		FileAppend "[Skills]`n", "settings.ini", "UTF-16-RAW"
		FileAppend "Skill1=0`n", "settings.ini", "UTF-16-RAW"
		FileAppend "Skill2=0`n", "settings.ini", "UTF-16-RAW"
		FileAppend "Skill3=0`n", "settings.ini", "UTF-16-RAW"
		FileAppend "Skill4=0`n", "settings.ini", "UTF-16-RAW"
		FileAppend "SkillLeft=0`n", "settings.ini", "UTF-16-RAW"
		FileAppend "SkillRight=0`n", "settings.ini", "UTF-16-RAW"
		FileAppend "PosX=0`n", "settings.ini", "UTF-16-RAW"
		FileAppend "PosY=0`n", "settings.ini", "UTF-16-RAW"
		FileAppend "Size=0`n", "settings.ini", "UTF-16-RAW"
		FileAppend "Opacity=255`n", "settings.ini", "UTF-16-RAW"
		FileAppend "[Bubbles]`n", "settings.ini", "UTF-16-RAW"
		FileAppend "Health=0`n", "settings.ini", "UTF-16-RAW"
		FileAppend "Resource=0`n", "settings.ini", "UTF-16-RAW"
		FileAppend "Toggle=0`n", "settings.ini", "UTF-16-RAW"
		FileAppend "[Extra]`n", "settings.ini", "UTF-16-RAW"
		FileAppend "Potion=0`n", "settings.ini", "UTF-16-RAW"
		FileAppend "Dash=0`n", "settings.ini", "UTF-16-RAW"
		FileAppend "Map=0`n", "settings.ini", "UTF-16-RAW"
		FileAppend "OTRpath=0`n", "settings.ini", "UTF-16-RAW"
	}
}

;Check if OTR can be found, if not ask for the path, if not ask to download
if (OTRpath = 0)
{
	

	if (OTRpath = 0)
	{
		result := MsgBox("Download OnTopReplica from https://github.com/LorenzCK/OnTopReplica", "OnTopReplica not found", 6)
		If (Result = "Continue")
		{
			Run "https://github.com/LorenzCK/OnTopReplica"
			ExitApp
		}
		else If (Result = "Cancel")
			ExitApp
		else If (Result = "TryAgain")
		{
			MsgBox "Select OnTopReplica.exe"
		}
	}

	OTRpath := FileSelect("3", "C:\Program Files (x86)\OnTopReplica\OnTopReplica\OnTopReplica.exe", "Select OnTopReplica.exe", "*.exe") ; Open file dialog with default path
	;removeexe := SubStr(OTRpath, -17)
	length := StrLen(OTRpath)
	OTRpath := SubStr(OTRpath, 1, length - 17)
	IniWrite(OTRpath, dirIni, "Extra", "OTRpath")
}

;-----------------------------

#Requires Autohotkey v2.0
;AutoGUI 2.5.8 
;Auto-GUI-v2 credit to Alguimist autohotkey.com/boards/viewtopic.php?f=64&t=89901
;AHKv2converter credit to github.com/mmikeww/AHK-v2-script-converter

myGui := Gui()
;myGui.BackColor := "0x8f0e04"
myGui.SetFont("s12")
;myGui.SetFont("cWhite")

ogcDropDownListDDLItems := myGui.Add("DropDownList", "x104 y8 w110", ["5120x1440", "2560x1440", "1920x1080"])
ogcDropDownListDDLItems2 := myGui.Add("DropDownList", "x344 y8 w110", ["Center","Left Corner"])
hDDLItems := ogcDropDownListDDLItems.hwnd
hDDLItems2 := ogcDropDownListDDLItems2.hwnd
myGui.Add("Text", "x8 y8 w84 h23 +0x200", "Resolution:")
myGui.Add("Text", "x240 y8 w100 h23 +0x200", "HUD Config:")
myGui.Add("Text", "x0 y45 w800 h2 +0x10")

; Checkboxes Skills
CheckBox_Storage1 := ogcCheckBoxChkSkill1 := myGui.Add("CheckBox", "vChkSkill1 x104 y66 w65 h23", "Skill1")
CheckBox_Storage2 := ogcCheckBoxChkSkill26 := myGui.Add("CheckBox", "vChkSkill26 x175 y66 w65 h23 +0x1", "Skill2")
CheckBox_Storage3 := ogcCheckBoxChkSkill32 := myGui.Add("CheckBox", "vChkSkill32 x246 y66 w65 h23 +0x1", "Skill3")
CheckBox_Storage4 := ogcCheckBoxChkSkill44 := myGui.Add("CheckBox", "vChkSkill44 x317 y66 w65 h23 +0x1", "Skill4")
CheckBox_Storage5 := ogcCheckBoxChkSkillleft3 := myGui.Add("CheckBox", "vChkSkillleft3 x390 y66 w90 h23 +0x1", "SkillLeft")
CheckBox_Storage6 := ogcCheckBoxChkSkillright5 := myGui.Add("CheckBox", "vChkSkillright5 x480 y66 w90 h23 +0x1", "SkillRight")

hChkSkill1 := ogcCheckBoxChkSkill1.hwnd
hChkSkill26 := ogcCheckBoxChkSkill26.hwnd
hChkSkill32 := ogcCheckBoxChkSkill32.hwnd
hChkSkillleft3 := ogcCheckBoxChkSkillleft3.hwnd
hChkSkill44 := ogcCheckBoxChkSkill44.hwnd
hChkSkillright5 := ogcCheckBoxChkSkillright5.hwnd

; Edit boxes Skills
Edit_Storage1 := ogcEditEdtValue := myGui.Add("Edit", "vEdtValue x128 y114 w75 h21 +Number")
myGui.Add("UpDown", "vMyUpDown Range0-5120 +0x80", 5)
Edit_Storage2 := myGui.Add("Edit",  "x104 y154 w72 h21 +Number")
myGui.Add("UpDown", "vMyUpDown1 Range0-100 +0x80", 5)
Edit_Storage3 := ogcEditEdtValue3 := myGui.Add("Edit", "vEdtValue3 x240 y114 w73 h21 +Number")
myGui.Add("UpDown", "vMyUpDown2 Range0-1440 +0x80", 5)

hEdtValue := ogcEditEdtValue.hwnd
hEdtValue3 := ogcEditEdtValue3.hwnd


; Text Skills
myGui.Add("Text", "x8 y66 w73 h26 +0x200", "Skills:")
myGui.Add("Text", "x8 y114 w73 h23 +0x200", "Position:")
myGui.Add("Text", "x8 y154 w71 h23 +0x200", "Size:")
myGui.Add("Text", "x104 y114 w28 h23 +0x200", "X =")
myGui.Add("Text", "x216 y114 w29 h23 +0x200", "Y =")
myGui.Add("Text", "x8 y194 w76 h23 +0x200", "Opacity:")
myGui.Add("Text", "x104 y194 w56 h23 +0x200", "Invisible")
myGui.Add("Text", "x392 y194 w37 h23 +0x200", "Solid")
myGui.setFont("s9")
myGui.setFont("s12")

; Slider Skills
Slider_Storage1 := ogcSliderSldr := myGui.Add("Slider", "vSldr x160 y194 w230 h32 Range0-255 +0x1")
hSldr := ogcSliderSldr.hwnd

; Checkboxes bubbles
CheckBox_Storage7 := ogcCheckBoxChkHealth7 := myGui.Add("CheckBox", "vChkHealth7 x104 y258 w70 h23 +0x1", "Health")
CheckBox_Storage8 := ogcCheckBoxChkResource8 := myGui.Add("CheckBox", "vChkResource8 x184 y258 w94 h23 +0x1", "Resource")


hChkHealth7 := ogcCheckBoxChkHealth7.hwnd
hChkResource8 := ogcCheckBoxChkResource8.hwnd


; Bubbles text
myGui.Add("Text", "x0 y242 w434 h2 +0x10")
myGui.Add("Text", "x8 y258 w73 h23 +0x200", "Bubbles:")
myGui.setFont("s9")
myGui.Add("Text", "x8 y280 w100 h23 +0x200", "(16:9 not supported)")
myGui.setFont("s12")

; Extra
myGui.Add("Text", "x-8 y328 w440 h2 +0x10")
myGui.Add("Text", "x8 y346 w47 h23 +0x200", "Extra:")
CheckBox_Storage9 := ogcCheckBoxChk9 := myGui.Add("CheckBox", "vChk9 x104 y380 w140 h23 +0x1", "Toggle (TAB)")
CheckBox_Storage10 := ogcCheckBoxChkPotion := myGui.Add("CheckBox", "vChkPotion x104 y346 w65 h23 +0x1", "Potion")
CheckBox_Storage11 := ogcCheckBoxChkDash := myGui.Add("CheckBox", "vChkDash x175 y346 w65 h23 +0x1", "Dash")
CheckBox_Storage12 := ogcCheckBoxChkMap := myGui.Add("CheckBox", "vChkMap x250 y346 w140 h23 +0x1", "Map (movable)")
hChk9 := ogcCheckBoxChk9.hwnd
hChkPotion := ogcCheckBoxChkPotion.hwnd
hChkDash := ogcCheckBoxChkDash.hwnd
hChkMap := ogcCheckBoxChkMap.hwnd

; Misc
myGui.Add("Text", "x0 y418 w431 h2 +0x10")
myGui.setFont("s9")
myGui.Add("Text", "x17 y475 w400 h23 +0x200", '(Always "Apply and Save" before clicking "Reload")')
myGui.Add("Text", "x505 y8 w400 h23 +0x200", '(Click "Apply and Save" then "Reload")')
myGui.setFont("s12")
myGui.Add("Picture", "x440 y114 w304 h366", dirImage)
ogcButtonSaveandApply := myGui.Add("Button", "x8 y434 w139 h41", "Save and Apply")
ogcButtonSaveandApply.OnEvent("Click", OnEventHandler)
ogcButtonHide := myGui.Add("Button", "x176 y434 w101 h40", "Reload")
ogcButtonHide.OnEvent("Click", UpdateReplica)
ogcButtonQuit := myGui.Add("Button", "x298 y434 w102 h39", "Quit")
ogcButtonQuit.OnEvent("Click", CloseProgram)
myGui.Title := "Diablo IV Overlay"
myGui.OnEvent('Close', (*) => ExitApp())
myGui.Show("w759 h546")

	; Added code: After GUI is drawn, load ini values to display saved settings from previous session
	CheckBox_Storage1.Value := skill1
	CheckBox_Storage2.Value := skill2
	CheckBox_Storage3.Value := skill3
	CheckBox_Storage4.Value := skill4
	CheckBox_Storage5.Value := skillLeft
	CheckBox_Storage6.Value := skillRight
	Edit_Storage1.Value	:= posX
	Edit_Storage3.Value 	:= posY
	Edit_Storage2.Value	:= size
	Slider_Storage1.Value	:= opacity

	CheckBox_Storage7.Value := health
	CheckBox_Storage8.Value := resource
	CheckBox_Storage9.Value := toggle
	ogcDropDownListDDLItems.Value := resolution
	ogcDropDownListDDLItems2.Value := hudconfig

	CheckBox_Storage10.Value := potion
	CheckBox_Storage11.Value := dash
	CheckBox_Storage12.Value := mapShow
	
	resolution := 	ogcDropDownListDDLItems.Value
	hudconfig := 	ogcDropDownListDDLItems2.Value
	skill1 := 	CheckBox_Storage1.Value
	skill2 := 	CheckBox_Storage2.Value
	skill3 := 	CheckBox_Storage3.Value
	skill4 := 	CheckBox_Storage4.Value
	skillLeft := 	CheckBox_Storage5.Value
	skillRight := 	CheckBox_Storage6.Value
	posX := 	Edit_Storage1.Value
	posY := 	Edit_Storage3.Value
	size := 	Edit_Storage2.Value
	opacity := 	Slider_Storage1.Value

	health := 	CheckBox_Storage7.Value
	resource := 	CheckBox_Storage8.Value

	toggle := 	CheckBox_Storage9.Value
	potion := 	CheckBox_Storage10.Value
	dash := 	CheckBox_Storage11.Value
	mapShow := 	CheckBox_Storage12.Value

Return



;------------------------------
;Func, takes ini values and creats cmd script based on checked options
makeBootFile(skill1,skill2,skill3,skill4,skillLeft,skillRight,posX,posY,size,health,resource,potion,dash,resolution,mapShow,opacity,hudconfig)
{
	numIcons := skill1 + skill2 + skill3 + skill4 + skillLeft + skillRight + potion + dash
	nextIcon := size + 5
	length := numIcons * nextIcon
	startX := Round(posX - length/2,0)

	; converts 32:9 coordinates into 16:9 if needed
	if(resolution = 3)
		size := Round(size * 0.75)
	if(hudconfig = 2)
	{
		xh := 	Round(pixelX(574,resolution),0)
		yh :=	Round(pixelX(1088,resolution),0)
		xr := 	Round(pixelX(727,resolution),0)
		yr :=	Round(pixelX(1225,resolution),0)
		xp := 	Round(pixelX(582,resolution),0)
		yp := 	Round(pixelY(1040,resolution),0)
		xs1 :=	Round(pixelX(873,resolution),0)
		ys1 :=	Round(pixelY(1308,resolution),0)
		xs2 :=	Round(pixelX(958,resolution),0)
		ys2 :=	Round(pixelY(1308,resolution),0)
		xs3 := 	Round(pixelX(1042,resolution),0)
		ys3 := 	Round(pixelY(1308,resolution),0)
		xs4 := 	Round(pixelX(1126,resolution),0)
		ys4 := 	Round(pixelY(1308,resolution),0)
		xsL := 	Round(pixelX(1209,resolution),0)
		ysL := 	Round(pixelY(1308,resolution),0)
		xsR := 	Round(pixelX(1293,resolution),0)
		ysR := 	Round(pixelY(1308,resolution),0)
		xd := 	Round(pixelX(724,resolution),0)
		yd := 	Round(pixelY(1161,resolution),0)
		xm := 	Round(pixelX(4304,resolution),0)
		ym := 	Round(pixelY(73,resolution),0)
	}
	else
	{
		xh := 	Round(pixelX(2067,resolution),0)
		yh :=	Round(pixelX(1231,resolution),0)
		xr := 	Round(pixelX(3000,resolution),0)
		yr :=	Round(pixelX(1232,resolution),0)
		xp := 	Round(pixelX(2158,resolution),0)
		yp := 	Round(pixelY(1243,resolution),0)
		xs1 :=	Round(pixelX(2315,resolution),0)
		ys1 :=	Round(pixelY(1306,resolution),0)
		xs2 :=	Round(pixelX(2399,resolution),0)
		ys2 :=	Round(pixelY(1306,resolution),0)
		xs3 := 	Round(pixelX(2483,resolution),0)
		ys3 := 	Round(pixelY(1306,resolution),0)
		xs4 := 	Round(pixelX(2568,resolution),0)
		ys4 := 	Round(pixelY(1306,resolution),0)
		xsL := 	Round(pixelX(2652,resolution),0)
		ysL := 	Round(pixelY(1306,resolution),0)
		xsR := 	Round(pixelX(2736,resolution),0)
		ysR := 	Round(pixelY(1306,resolution),0)
		xd := 	Round(pixelX(2907,resolution),0)
		yd := 	Round(pixelY(1197,resolution),0)
		xm := 	Round(pixelX(4304,resolution),0)
		ym := 	Round(pixelY(73,resolution),0)
	}

	content := dirRoot . "`r`n"
	if (health = 1)
  		content .= "start OnTopReplica.exe --windowTitle=`"Diablo IV`" --region=" . xh . "," . yh . ",50,180 --size=397,1440 --position=0,0 --chromeOff --clickThrough" . "`r`n" ; health
	sleep 50
	if (resource = 1)
   		content .= "start OnTopReplica.exe --windowTitle=`"Diablo IV`" --region=" . xr . "," . yr . ",50,180 --width=400 --position=4717,0 --chromeOff --clickThrough" . "`r`n" ; resource
	sleep 50
	if (potion = 1)
	{
		content .= "start OnTopReplica.exe --windowTitle=`"Diablo IV`" --region=" . xp . "," . yp . ",34,19 --size=" . size . "," . Round((size*(19/34)),0) . " --opacity=" . opacity . " --position=" . startX . "," . posY . " --chromeOff --clickThrough" . "`r`n" ; potion
		startX := startX + nextIcon
	}
	sleep 50
	if (skill1 = 1)
	{
		content .= "start OnTopReplica.exe --windowTitle=`"Diablo IV`" --region=" . xs1 . "," . ys1 . ",70,70 --size=" . size . "," . size . " --opacity=" . opacity . " --position=" . startX . "," . posY . " --chromeOff --clickThrough" . "`r`n" ; skill1
		startX := startX + nextIcon
	}
	sleep 50
	if (skill2 = 1)
	{
		content .= "start OnTopReplica.exe --windowTitle=`"Diablo IV`" --region=" . xs2 . "," . ys2 . ",70,70 --size=" . size . "," . size . " --opacity=" . opacity . " --position=" . startX . "," . posY . " --chromeOff --clickThrough" . "`r`n" ; skill2
		startX := startX + nextIcon
	}
	sleep 50
	if (skill3 = 1)
	{
		content .= "start OnTopReplica.exe --windowTitle=`"Diablo IV`" --region=" . xs3 . "," . ys3 . ",70,70 --size=" . size . "," . size . " --opacity=" . opacity . " --position=" . startX . "," . posY . " --chromeOff --clickThrough" . "`r`n" ; skill3
		startX := startX + nextIcon
	}
	sleep 50
	if (skill4 = 1)
	{
		content .= "start OnTopReplica.exe --windowTitle=`"Diablo IV`" --region=" . xs4 . "," . ys4 . ",70,70 --size=" . size . "," . size . " --opacity=" . opacity . " --position=" . startX . "," . posY . " --chromeOff --clickThrough" . "`r`n" ; skill4
		startX := startX + nextIcon
	}
	sleep 50
	if (skillLeft = 1)
	{
		content .= "start OnTopReplica.exe --windowTitle=`"Diablo IV`" --region=" . xsL . "," . ysL . ",70,70 --size=" . size . "," . size . " --opacity=" . opacity . " --position=" . startX . "," . posY . " --chromeOff --clickThrough" . "`r`n" ; skillLeft
		startX := startX + nextIcon
	}
	sleep 50
	if (skillRight = 1)
	{
		content .= "start OnTopReplica.exe --windowTitle=`"Diablo IV`" --region=" . xsR . "," . ysR . ",70,70 --size=" . size . "," . size . " --opacity=" . opacity . " --position=" . startX . "," . posY . " --chromeOff --clickThrough" . "`r`n" ; skillRight
		startX := startX + nextIcon
	}
	sleep 50
	if (dash = 1)
	{
		content .= "start OnTopReplica.exe --windowTitle=`"Diablo IV`" --region=" . xd . "," . yd . ",50,50 --size=" . size . "," . size . " --opacity=" . opacity . " --position=" . startX . "," . posY . " --chromeOff --clickThrough" . "`r`n" ; dash
		startX := startX + nextIcon
	}
	sleep 50
	if (mapShow = 1)
	{
		content .= "start OnTopReplica.exe --windowTitle=`"Diablo IV`" --region=" . xm . "," . ym . ",384,277 --width=300 --position=500,500" . "`r`n" ; Map
	}
	sleep 50

	; Recreate file on each "Save and Apply" click
	if FileExist("boot.cmd")
		FileDelete dirBoot
	FileAppend content, dirBoot
}
;------------------------------------------
pixelX(default,res)
{
	newX := default
	if(res = 1)
		return newX
	else if(res = 2)
	{
		newX := (newX / 5120)*2560
		return newX
	}
	else
	{
		newX := (newX / 5120)*1920
		return newX
	}
}

pixelY(default,res)
{
	newY := default
	if(res = 1)
		return newY
	else if(res = 2)
	{
		newX := (newY / 1440)*1440
		return newY
	}
	else
	{
		newX := (newY / 1440)*1080
		return newY
	}
}
;-------------------------------------------

;Saves options and boots the overlay
OnEventHandler(*)
{
	; probs not neccesary-----(is neccesary, dunno)
	resolution :=	ogcDropDownListDDLItems.Value
	hudconfig := 	ogcDropDownListDDLItems2.Value
	prevRes := 	IniRead(dirIni, "General", "PrevResolution")
	skill1 := 	CheckBox_Storage1.Value
	skill2 := 	CheckBox_Storage2.Value
	skill3 := 	CheckBox_Storage3.Value
	skill4 := 	CheckBox_Storage4.Value
	skillLeft := 	CheckBox_Storage5.Value
	skillRight := 	CheckBox_Storage6.Value
	posX := 	Edit_Storage1.Value
	posY := 	Edit_Storage3.Value
	size := 	Edit_Storage2.Value
	opacity := 	Slider_Storage1.Value
	health := 	CheckBox_Storage7.Value
	resource := 	CheckBox_Storage8.Value
	toggle := 	CheckBox_Storage9.Value
	potion := 	CheckBox_Storage10.Value
	dash := 	CheckBox_Storage11.Value
	mapShow := 	CheckBox_Storage12.Value
	;---------
	if (resolution = 1 && resolution != prevRes)
	{
		posX := 2560
		posY := 760
		size := 40
	}
	else if (resolution = 2 && resolution != prevRes)
	{
		posX := 1280
		posY := 760
		size := 40
	}
	else if (resolution = 3 && resolution != prevRes)
	{
		posX := 960
		posY := 570
		size := 30
	}
	prevRes := resolution
	
	; Save settings to settings.ini
	IniWrite(resolution, dirIni, "General", "Resolution")
	IniWrite(hudconfig, dirIni, "General", "HUD Config")
	IniWrite(prevRes, dirIni, "General", "PrevResolution")
	IniWrite(skill1, dirIni, "Skills", "Skill1")
	IniWrite(skill2, dirIni, "Skills", "Skill2")
	IniWrite(skill3, dirIni, "Skills", "Skill3")
	IniWrite(skill4, dirIni, "Skills", "Skill4")
	IniWrite(skillLeft, dirIni, "Skills", "SkillLeft")
	IniWrite(skillRight, dirIni, "Skills", "SkillRight")
	IniWrite(posX, dirIni, "Skills", "PosX")
	IniWrite(posY, dirIni, "Skills", "PosY")
	IniWrite(size, dirIni, "Skills", "Size")
	IniWrite(opacity, dirIni, "Skills", "Opacity")

	IniWrite(health, dirIni, "Bubbles", "Health")
	IniWrite(resource, dirIni, "Bubbles", "Resource")
	IniWrite(toggle, dirIni, "Bubbles", "Toggle")
	
	IniWrite(potion, dirIni, "Extra", "Potion")
	IniWrite(dash, dirIni, "Extra", "Dash")
	IniWrite(mapShow, dirIni, "Extra", "Map")
	
	while WinExist("OnTopReplica")
	{
		processClose "OnTopReplica.exe"
	}

	
	; Make and run cmd file, group OnTopReplica to ease minimize
	makeBootFile(skill1,skill2,skill3,skill4,skillLeft,skillRight,posX,posY,size,health,resource,potion,dash,resolution,mapShow,opacity,hudconfig)
	Run dirBoot,, "Hide"
	sleep 1000
	GroupAdd "overlay", "OnTopReplica"
	
	WinActivate("Diablo IV Overlay")

	; if toggle is checked, will make Diablo on top and vice versa
	sleep 1000
	if(toggle = 1)
		toggleLoop()
}
toggleLoop()
{
	prev := "true"
	show := GetKeyState("Tab", "T")
	while(toggle = 1)
	{
		if(show != GetKeyState("Tab", "T"))	
		{
			WinSetAlwaysOnTop 1, "Diablo IV"
			;WinSetAlwaysOnTop 0, "ahk_group overlay"
			;WinMoveBottom "ahk_group overlay"
			prev := "false"
		}
		else if (prev = "false")
		{
			WinSetAlwaysOnTop 0, "Diablo IV"
			;WinSetAlwaysOnTop 1, "ahk_group overlay"
			;WinMoveTop "ahk_group overlay"
			prev := "true"
		}
	
	}
}

UpdateReplica(*)
{
	while WinExist("OnTopReplica")
	{
		processClose "OnTopReplica.exe"
	}
	Reload
}
CloseProgram(*)
{
	while WinExist("OnTopReplica")
	{
		processClose "OnTopReplica.exe"
	}
	ExitApp
}

Clock()
{
	
	checkTime := FormatTime(A_Now,"HHmm")
	boss1 := "World Boss 1 | 06:30 - 08:30 | Time: "
	boss2 := "World Boss 2 | 12:30 - 14:30 | Time: "
	boss3 := "World Boss 3 | 18:30 - 20:30 | Time: "
	boss4 := "World Boss 4 | 00:30 - 02:30 | Time: "
	
	if(checkTime < "0830" && checkTime > "0230")
		timeString := boss1 FormatTime(A_Now,"HH:mm:ss")
	else if(checkTime < "1430")
		timeString := boss2 FormatTime(A_Now,"HH:mm:ss")
	else if(checkTime < "2030")
		timeString := boss3 FormatTime(A_Now,"HH:mm:ss")
	else
		timeString := boss4 FormatTime(A_Now,"HH:mm:ss")

	CoordMode "ToolTip", "Screen"
	ToolTip timeString, 4450, 354
}

kill()
{
	
	Run A_WorkingDir . "\killOTR.cmd",, "Hide"
}
