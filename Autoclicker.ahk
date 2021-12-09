/*
 * * * Compile_AHK SETTINGS BEGIN * * *

[AHK2EXE]
Exe_File=%In_Dir%\Autoclicker.exe
No_UPX=1
Execution_Level=2
[VERSION]
Set_Version_Info=1
Company_Name=Koi
File_Description=Auto Clicker
Inc_File_Version=0
Internal_Name=Clicker v2
Legal_Copyright=not really
Original_Filename=Clicker v2
Product_Name=Auto Clicker
Product_Version=1.1.33.2
Set_AHK_Version=1
Language_ID=40
[ICONS]
Icon_1=C:\Users\kaipy\Downloads\Mouse icon png.ico
Icon_2=0
Icon_3=0
Icon_4=0
Icon_5=0

* * * Compile_AHK SETTINGS END * * *
*/

#SingleInstance Force
#MaxThreadsPerHotkey 2
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetBatchLines, -1
SendMode Input
SetWinDelay, -1
SetControlDelay, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0

Menu, Tray, NoStandard
Menu, Tray, Add, &Options, exit

keysToCheck := "Unbound||Left Mouse Button|Right Mouse Button|Middle Mouse Button|Side Mouse Button 1|Side Mouse Button 2|1|2|3|4|5|6|7|8|9|0|q|w|e|r|t|y|u|i|o|p|a|s|d|f|g|h|j|k|l|z|x|c|v|b|n|m|[|]|;|'|#|,|.|/|\|-|=|CapsLock|Space|Tab|Enter|BackSpace|ScrollLock|Del|Ins|Home|End|PgUp|PgDn|Up|Down|Left|Right|Numpad0|Numpad1|Numpad2|Numpad3|Numpad4|Numpad5|Numpad6|Numpad7|Numpad8|Numpad9|NumpadDel|Numlock|NumpadDiv|NumpadMult|NumpadAdd|NumpadSub|NumpadEnter|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|LShift|LCtrl|RCtrl|RShift|LAlt|RAlt"

global cps
global click1



;GUI LAYOUT
;.....................................

Gui, Add,Text, x10 y10, Please select your key binding
Gui, Add, DropDownList ,w200 r10 vstart1, %keysToCheck%
Gui, Add,Text,, Please select the button you want clicked
Gui, Add, DropDownlist, w200 r10 vclick1, %keysToCheck%
Gui, add, Edit, w50 vcps number,
Gui, add, UpDown, vUpDown Range1-60, 20
Gui, Add, Text, x67 y107 , CPS
Gui, Add,Text,x10 y+10, Please select your Exit key
Gui, Add, DropDownList, w200 r10 vExitkey, %keysToCheck%
Gui, Add, Button, x10 y176 gSave, Save Presets
Gui, add, Button, x10 w200 gFinish, Finish
Gui, Show, w225 h250, Clicker v3?
;.........................

;LOAD FILE
;..................................
IniRead, start1, %A_Desktop%\Autoclickpresets.ini, presets, start1
IniRead, CPS1, %A_Desktop%\Autoclickpresets.ini, presets, CPS1
if (%CPS1% == ERROR){
    CPS1 := 20
}
IniRead, Exitkey, %A_Desktop%\Autoclickpresets.ini, presets, Exitkey
IniRead, click1, %A_Desktop%\Autoclickpresets.ini, presets, click1
GuiControl, ChooseString, start1, %start1%
GuiControl,, cps, %CPS1%
GuiControl, ChooseString, Exitkey, %Exitkey%
GuiControl, ChooseString, click1, %click1%
Gui, Show
return
;......................................


cps := -1

Save:
    gui, Submit, NoHide
    IniDelete, %A_Desktop%\Autoclickpresets.ini, presets
    IniWrite,%start1%, %A_Desktop%\Autoclickpresets.ini, presets, start1
    IniWrite,%cps%, %A_Desktop%\Autoclickpresets.ini, presets, CPS1
    IniWrite,%Exitkey%, %A_Desktop%\Autoclickpresets.ini, presets, Exitkey
    IniWrite,%click1%, %A_Desktop%\Autoclickpresets.ini, presets, click1
    MsgBox,,,Saved Successfully
    return

    


Finish:

    Gui, Submit, NoHide
    Gui, -AlwaysonTop
    if (start1 == "Unbound"){
        MsgBox,,,Please select a keybind
    }
    else if(Exitkey == "Unbound"){
        MsgBox,,,Please select an Exit Key
    }
    else if(click1 == "Unbound"){
        MsgBox,,,Please select the key you want pressed
    
    }
    else if(cps < 0){
        Msgbox,,,Please enter in a CPS
    }
    else{

        Gui, Submit, NoHide
        SetKeyDelay % CPS ? CPS : -1, -1
        Gui, Destroy
        Bindings("start1","Clicker")
        Bindings("Exitkey","Leave")
    } 

autoClicker()
{
    static Toggle := False
    Toggle := !Toggle
    if (click1 == "Left Mouse Button"){
            click1 := "LButton"
        }
    else if (click1 == "Right Mouse Button"){
            click1 := "RButton"
        }
    else if (click1 == "Middle Mouse Button"){
            click1 := "MButton"
        }

    while (Toggle)
    {
        Send % "{" click1 "}"
        Sleep % 1000/cps
    }
}


exit()
{
    MsgBox,2,Warning, Are you sure you want to exit?
    IfMsgBox, Abort
        ExitApp
    IfMsgBox, Retry
        Reload
    IfMsgBox, Cancel
        return
    IfMsgBox, Timeout
        return
}

Esc::ExitApp


Bindings(DDL, label)
{
    scolon := ;
    if (%DDL% == "q"){
        Hotkey,q, % label
    return
    }
    else if (%DDL% == "w"){
        Hotkey, w, % label
    return
    }
    else if (%DDL% == "e"){
        Hotkey, r, % label
    return
    }
    else if (%DDL% == "t"){
        Hotkey, t, % label
    return
    }
    else if (%DDL% == "y"){
        Hotkey, y, % label
    return
    }
    else if (%DDL% == "u"){
        Hotkey, u, % label
    return
    }
    else if (%DDL% == "i"){
        Hotkey, i, % label
    return
    }
    else if (%DDL% == "o"){
        Hotkey, o, % label
    return
    }
    else if (%DDL% == "p"){
        Hotkey, p, % label
    return
    }
    else if (%DDL% == "a"){
        Hotkey, a, % label
        
    return
    }
    else if (%DDL% == "s"){
        Hotkey, s, % label
        
    return
    }
    else if (%DDL% == "d"){
        Hotkey, d, % label
        
    return
    }
    else if (%DDL% == "f"){
        Hotkey, f, % label
        
    return
    }
    else if (%DDL% == "g"){
        Hotkey, g, % label
        
    return
    }
    else if (%DDL% == "h"){
        Hotkey, h, % label
        
    return
    }
    else if (%DDL% == "j"){
        Hotkey, j, % label
        
    return
    }
    else if (%DDL% == "k"){
        Hotkey, k, % label
        
    return
    }
    else if (%DDL% == "l"){
        Hotkey, l, % label
        
    return
    }
    else if (%DDL% == "["){
        Hotkey, [, % label
        
    return
    }
    else if (%DDL% == "]"){
        Hotkey, ], % label
        
    return
    }
    else if (%DDL% == ";"){
        Hotkey, %scolon%, % label
        
    return
    }
    else if (%DDL% == "'"){
        Hotkey, ', % label
        
    return
    }
    else if (%DDL% == "#"){
        Hotkey, #, % label
        
    return
    }
    else if (%DDL% == "z"){
        Hotkey, z, % label
        
    return
    }
    else if (%DDL% == "x"){
        Hotkey, x, % label
        
    return
    }
    else if (%DDL% == "c"){
        Hotkey, c, % label
        
    return
    }
    else if (%DDL% == "v"){
        Hotkey, v, % label
        
    return
    }
    else if (%DDL% == "b"){
        Hotkey, b, % label
        
    return
    }
    else if (%DDL% == "n"){
        Hotkey, n, % label
        
    return
    }
    else if (%DDL% == "m"){
        Hotkey, m, % label
        
    return
    }
    else if (%DDL% == ","){
        comma = ,
        Hotkey, %comma%, % label
        
    return
    }
    else if (%DDL% == "/"){
        Hotkey, /, % label
        
    return
    }
    else if (%DDL% == "\"){
        Hotkey, \, % label
        
    return
    }
    else if (%DDL% == "1"){
        Hotkey, 1, % label
        
    return
    }
    else if (%DDL% == "2"){
        Hotkey, 2, % label
        
    return
    }
    else if (%DDL% == "3"){
        Hotkey, 3, % label
        
    return
    }
    else if (%DDL% == "4"){
        Hotkey,4, % label
        
    return
    }
    else if (%DDL% == "5"){
        Hotkey, 5, % label
        
    return
    }
    else if (%DDL% == "6"){
        Hotkey, 6, % label
        
    return
    }
    else if (%DDL% == "7"){
        Hotkey, 7, % label
        
    return
    }
    else if (%DDL% == "8"){
        Hotkey, 8, % label
        
    return
    }
    else if (%DDL% == "9"){
        Hotkey, 9, % label
        
    return
    }
    else if (%DDL% == "0"){
        Hotkey, 0, % label
        
    return
    }
    else if (%DDL% == "-"){
        Hotkey, -, % label
        
    return
    }
    else if (%DDL% == "="){
        Hotkey, =, % label
        
    return
    }
    else if (%DDL% == "Left Mouse Button"){
        Hotkey, LButton, % label
        
    return
    }
    else if (%DDL% == "Right Mouse Button"){
        Hotkey, RButton, % label
    return
    }
    else if (%DDL% == "Middle Mouse Button"){
        Hotkey, MButton, % label
    return
    }
    else if (%DDL% == "Side Mouse Button 1"){
        Hotkey, XButton1, % label
    return
    } 
    else if (%DDL% == "Side Mouse Button 2"){
        Hotkey, XButton2, % label
    return
    }
    else if (%DDL% == "CapsLock"){
        Hotkey, CapsLock, % label
    return
    }
    else if (%DDL% == "Space"){
        Hotkey, Space, % label
    return
    }
    else if (%DDL% == "Tab"){
        Hotkey, Tab, % label
    return
    }
    else if (%DDL% == "Enter"){
        Hotkey, Enter, % label
    return
    }
    else if (%DDL% == "BackSpace"){
        Hotkey, BackSpace, % label
    return
    }
    else if (%DDL% == "ScrollLock"){
        Hotkey, ScrollLock, % label
    return
    }
    else if (%DDL% == "Del"){
        Hotkey, Del, % label
        
    return
    }
    else if (%DDL% == "Ins"){
        Hotkey, Ins, % label
        
    return
    }
    else if (%DDL% == "Home"){
        Hotkey, Home, % label
        
    return
    }
    else if (%DDL% == "End"){
        Hotkey, End, % label
        
    return
    }
    else if (%DDL% == "PgUp"){
        Hotkey, PGUP, % label
        
    return
    }
    else if (%DDL% == "PgDn"){
        Hotkey, PGDN, % label
        
    return
    }
    else if (%DDL% == "Up"){
        Hotkey, Up, % label
        
    return
    }
    else if (%DDL% == "Down"){
        Hotkey, Down, % label
        
    return
    }
    else if (%DDL% == "Left"){
        Hotkey, Left, % label
        
    return
    }
    else if (%DDL% == "Right"){
        Hotkey, Right, % label
        
    return
    }
    else if (%DDL% == "Numpad1"){
        Hotkey, Numpad1, % label
        
    return
    }
    else if (%DDL% == "Numpad2"){
        Hotkey, Numpad2, % label
        
    return
    }
    else if (%DDL% == "Numpad3"){
        Hotkey, Numpad3, % label
        
    return
    }
    else if (%DDL% == "Numpad4"){
        Hotkey, Numpad4, % label
        
    return
    }
    else if (%DDL% == "Numpad5"){
        Hotkey, Numpad5, % label
        
    return
    }
    else if (%DDL% == "Numpad6"){
        Hotkey, Numpad6, % label
        
    return
    }
    else if (%DDL% == "Numpad7"){
        Hotkey, Numpad7, % label
        
    return
    }
    else if (%DDL% == "Numpad8"){
        Hotkey, Numpad8, % label
        
    return
    }
    else if (%DDL% == "Numpad9"){
        Hotkey, Numpad9, % label
        
    return
    }
    else if (%DDL% == "NumpadDel"){
        Hotkey, NumpadDel, % label
        
    return
    }
    else if (%DDL% == "Numlock"){
        Hotkey, NumLock, % label
        
    return
    }
    else if (%DDL% == "NumpadDiv"){
        Hotkey, NumpadDiv, % label
        
    return
    }
    else if (%DDL% == "NumpadMult"){
        Hotkey, NumpadMult, % label
        
    return
    }
    else if (%DDL% == "NumpadAdd"){
        Hotkey, NumpadAdd, % label
        
    return
    }
    else if (%DDL% == "NumpadSub"){
        Hotkey, NumpadSub, % label
        
    return
    }
    else if (%DDL% == "NumpadEnter"){
        Hotkey, Numpad3, % label
        
    return
    }
    else if (%DDL% == "F1"){
        Hotkey, F1, % label
        
    return
    }
    else if (%DDL% == "F2"){
        Hotkey, F2, % label
        
    return
    }
    else if (%DDL% == "F3"){
        Hotkey, F3, % label
        
    return
    }
    else if (%DDL% == "F4"){
        Hotkey, F4, % label
        
    return
    }
    else if (%DDL% == "F5"){
        Hotkey, F5, % label
        
    return
    }
    else if (%DDL% == "F6"){
        Hotkey, F6, % label
        
    return
    }
    else if (%DDL% == "F7"){
        Hotkey, F7, % label
        
    return
    }
    else if (%DDL% == "F8"){
        Hotkey, F8, % label
        
    return
    }
    else if (%DDL% == "F9"){
        Hotkey, F9, % label
        
    return
    }
    else if (%DDL% == "F10"){
        Hotkey, F10, % label
        
    return
    }
    else if (%DDL% == "F11"){
        Hotkey, F11, % label
        
    return
    }
    else if (%DDL% == "F12"){
        Hotkey, F12, % label
        
    return
    }
    else if (%DDL% == "LShift"){
        Hotkey, LShift, % label
        
    }
    else if (%DDL% == "LCtrl"){
        Hotkey, LCtrl, % label
        
    return
    }
    else if (%DDL% == "RCtrl"){
        Hotkey, RCtrl, % label
        
    return
    }
    else if (%DDL% == "RShift"){
        Hotkey, RShift, % label
        
    return
    }
    else if (%DDL% == "LAlt"){
        Hotkey, LAlt, % label
        
    return
    }
    else if (%DDL% == "RAlt"){
        Hotkey, RAlt, % label
    return
    }
    Clicker:
        autoClicker()
    return
    Leave:
        exit()
    return
}