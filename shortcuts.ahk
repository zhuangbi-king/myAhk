#Include windows_ops.ahk

#E:: {
    hwnd := WinExist("ahk_class TTOTAL_CMD ahk_exe doublecmd.exe")
    if hwnd {
        WinActivate(hwnd)
    } else {
        Run("D:\Double Commander\doublecmd.exe")
    }
}

^+!E:: {
    Run("C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe")
}
^+!D:: {
    Run("D:\draw.io\draw.io.exe")
}
^+Space:: {
    Run("C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe https://copilot.microsoft.com/chats/47cnSY8aZqNh8aUPypgp5")
}

^+!T:: {
    WinTop(WinActive("A"))
}


; Alt+滚轮事件绑定，调整透明度
!WheelUp:: AdjustOpacity(TRANSPARENTSTEP)
!WheelDown:: AdjustOpacity(-TRANSPARENTSTEP)

; 调整窗口大小
; ^+!H:: ResizeWindow(WinActive("A"), WindowAction.LEFT)
^+!]:: ResizeWindow(WinActive("A"), WindowAction.RIGHT)
; ^+!J:: ResizeWindow(WinActive("A"), WindowAction.UP)
^+![:: ResizeWindow(WinActive("A"), WindowAction.DOWN)
; ^+!U:: ResizeWindow(WinActive("A"), WindowAction.LEFT, -EXTENDSTEPS)
^+!P:: ResizeWindow(WinActive("A"), WindowAction.RIGHT, -EXTENDSTEPS)
; ^+!I:: ResizeWindow(WinActive("A"), WindowAction.UP, -EXTENDSTEPS)
^+!-:: ResizeWindow(WinActive("A"), WindowAction.DOWN, -EXTENDSTEPS)

; 调整窗口位置
^+!BackSpace:: ResizeWindow(WinActive("A"), WindowAction.CENTER)
^+!J:: MoveWindow(WinActive("A"), WindowAction.LEFT)
^+!K:: MoveWindow(WinActive("A"), WindowAction.DOWN)
^+!L:: MoveWindow(WinActive("A"), WindowAction.RIGHT)
^+!I:: MoveWindow(WinActive("A"), WindowAction.UP)