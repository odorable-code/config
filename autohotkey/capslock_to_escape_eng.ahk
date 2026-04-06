Capslock::Escape

#HotIf WinActive("ahk_exe code.exe") OR WinActive("ahk_exe idea64.exe")
Escape::ImeChange("{Escape}")
^[::ImeChange("^[")
CapsLock::ImeChange("{Escape}")
#HotIf
; 키보드 언어 상태 확인 1이면 한글 0이면 영문
ImeCheck(WinTitle) {
 hWnd := WinGetID(WinTitle)
 Return SendImeControl(ImmGetDefaultIMEWnd(hWnd),0x005,"")
}
SendImeControl(DefaultIMEWnd, wParam, lParam) {
 DetectSave := A_DetectHiddenWindows
 DetectHiddenWindows true
 result := SendMessage(0x283, wParam,lParam,,"ahk_id " DefaultIMEWnd)
 if (DetectSave != A_DetectHiddenWindows)
  DetectHiddenWindows DetectSave
 return result
}
ImmGetDefaultIMEWnd(hWnd) {
 return DllCall("imm32\ImmGetDefaultIMEWnd", "Uint", hWnd, "Uint")
}
ImeChange(key) {
  if (ImeCheck("A") = 1) {
    Send "{vk15sc138}"
  }
  Send key
} 