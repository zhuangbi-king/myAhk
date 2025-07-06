TRANSPARENTSTEP := 5              ; 调整透明度步长
EXTENDSTEPS := 50                 ; 窗口扩展步长
MOVESTEPS := 50                  ; 窗口移动步长

; 枚举窗口操作类型
WindowAction := {
    CENTER: 1,
    LEFT: 2,
    RIGHT: 3,
    UP: 4,
    DOWN: 5
}

; 统一的消息提示
ShowTip(msg) {
    ToolTip(msg, 10, 10)
    SetTimer(() => ToolTip(), -1000)
}

; 校验最小值
CheckMinSize(val, min := 1) {
    return val <= 0 ? min : val
}

; 透明度调整函数
AdjustOpacity(delta) {
    ahk_id := WinActive("A")
    if !ahk_id {
        ShowTip("未找到活动窗口")
        return
    }
    cur := WinGetTransparent(ahk_id)
    if cur == "" {
        cur := 255
    }
    new := Max(0, Min(255, cur + delta))
    WinSetTransparent(new, ahk_id)
    ShowTip("透明度: " . Integer(new * 100 / 255) . "%")
}

; 置顶指定窗口，如果已经置顶则取消置顶
WinTop(hwnd) {
    if !hwnd {
        ShowTip("无效窗口句柄")
        return
    }
    if WinGetExStyle(hwnd) & 0x8 { ; WS_EX_TOPMOST
        tip := "已取消置顶"
    } else {
        tip := "已置顶"
    }
    WinSetAlwaysOnTop(-1, hwnd)
    ShowTip(tip)
}

; 调整窗口大小或位置
ResizeWindow(hwnd, action, steps := EXTENDSTEPS) {
    if !hwnd {
        ShowTip("无效窗口句柄")
        return
    }
    ExtendWindow(hwnd, action, steps)
}

; 扩展或移动窗口
ExtendWindow(hwnd, action, step := EXTENDSTEPS) {
    if !hwnd {
        ShowTip("无效窗口句柄")
        return
    }
    x := 0, y := 0, width := 0, height := 0
    WinGetPos(&x, &y, &width, &height, hwnd)
    msg := ""
    newX := x, newY := y, newW := width, newH := height

    switch action {
        case WindowAction.LEFT:
            differ := Min(x, step)
            newW := CheckMinSize(width + differ)
            differ := newW - width
            newX := x - differ
            msg := step > 0 ? "窗口已向左扩展" : "窗口已向右收缩"
        case WindowAction.RIGHT:
            differ := Min(A_ScreenWidth - (x + width), step)
            newW := CheckMinSize(width + differ)
            differ := newW - width
            msg := step > 0 ? "窗口已向右扩展" : "窗口已向左收缩"
        case WindowAction.UP:
            differ := Min(y, step)
            newH := CheckMinSize(height + differ)
            differ := newH - height
            newY := y - differ
            msg := step > 0 ? "窗口已向上扩展" : "窗口已向下收缩"
        case WindowAction.DOWN:
            differ := Min(A_ScreenHeight - (y + height), step)
            newH := CheckMinSize(height + differ)
            differ := newH - height
            msg := step > 0 ? "窗口已向下扩展" : "窗口已向上收缩"
        case WindowAction.CENTER:
            newX := (A_ScreenWidth - width) // 2
            newY := (A_ScreenHeight - height) // 2
            msg := "窗口已居中"
        default:
            msg := "未知操作"
    }

    if (newX != x || newY != y || newW != width || newH != height) {
        WinMove(newX, newY, newW, newH, hwnd)
    }
    msg := msg . "目前参数：" . " (" . newX . ", " . newY . ") 大小" . " (" . newW . ", " . newH . ")"
    ShowTip(msg)
}


; 窗口移动（不改变大小）
MoveWindow(hwnd, action, step := MOVESTEPS) {
    if !hwnd {
        ShowTip("无效窗口句柄")
        return
    }
    x := 0, y := 0, width := 0, height := 0
    WinGetPos(&x, &y, &width, &height, hwnd)
    msg := ""
    newX := x, newY := y

    switch action {
        case WindowAction.LEFT:
            newX := Max(0, x - step)
            msg := "窗口已向左移动"
        case WindowAction.RIGHT:
            newX := Min(A_ScreenWidth - width, x + step)
            msg := "窗口已向右移动"
        case WindowAction.UP:
            newY := Max(0, y - step)
            msg := "窗口已向上移动"
        case WindowAction.DOWN:
            newY := Min(A_ScreenHeight - height, y + step)
            msg := "窗口已向下移动"
        default:
            msg := "未知方向"
    }
    if (newX != x || newY != y)
        WinMove(newX, newY, width, height, hwnd)
    msg := msg . "到位置" . " (" . newX . ", " . newY . ")"
    ShowTip(msg)
}