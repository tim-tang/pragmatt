-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config

-- This is setup for dual 1920x1080 monitors, with the right monitor as primary
Config {
    font = "xft:ProFontWindows:size=8:antialias=true",
    -- font = "xft:gohufont:size=9.4:antialias=true",
    additionalFonts = ["xft:ProFontWindows:size=9:antialias=true:oblique"],
    -- additionalFonts = ["xft:gohufont:size=11:antialias=true:oblique"],
    textOffset = -1,
    iconOffset = -1,
    allDesktops = True,
    overrideRedirect = True,
    pickBroadest = True,
    persistent = True,
    hideOnStart = False,
    iconRoot = ".",
    bgColor = "#202020",
    fgColor = "orange",
    position = Static { xpos = 0, ypos = 0, width = 2560, height = 18 },
    -- position = Static { xpos = 0, ypos = 0, width = 1440, height = 18 },
    -- position = TopW L 60,
    alpha = 255,
    border = NoBorder,
    borderColor = "gray",
    lowerOnStart = True,
    commands = [
        --Run Weather "KPAO" ["-t","<tempF>F <skyCondition>","-L","64","-H","77","-n","#CEFFAC","-h","#FFB6B0","-l","#96CBFE"] 36000,
        Run MultiCpu ["-t","CPU: <total0>% <total1>% <total2>% <total3>%","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10,
        Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Network "wlp4s0" ["-t","Net: <rx>Kb/s - <tx>Kb/s ","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
        Run Battery ["-t","<leftvbar> <left>%/<timeleft>","-L","50","-H","75","-h","green","-n","yell","-l","red"] 10,
        Run Date "%a %b %_d %H:%M:%S" "date" 10,
        Run StdinReader
    ],
    sepChar = "%",
    alignSep = "}{",
    template = "%StdinReader% }{ %multicpu% |  %memory% |  %swap% | %wlp4s0% | %battery% | <fc=#FFFFCC>%date%</fc>"
}
