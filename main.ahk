#Requires AutoHotkey v2.0
#SingleInstance Force

#Include windows_ops.ahk
#Include shortcuts.ahk

; #：表示 Windows 键（Win）
; ^ ：表示 Ctrl 键
; + ：表示 Shift 键
; !：表示 Alt 键


; Hot String
::/gs::git status
::/grh::git reset --hard HEAD
::/gr::git reset HEAD
::/gc::git clean -i -d

:*:/pwd::shuaigezhenshuai

return