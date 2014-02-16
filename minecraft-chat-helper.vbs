' The MIT License (MIT)
'
' Copyright (c) 2014 Star Brilliant <m13253@hotmail.com>
' Copyright (c) 2014 Arthur200000 <crashedsystem67@gmail.com>
'
' Permission is hereby granted, free of charge, to any person obtaining a copy
' of this software and associated documentation files (the "Software"), to deal
' in the Software without restriction, including without limitation the rights
' to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
' copies of the Software, and to permit persons to whom the Software is
' furnished to do so, subject to the following conditions:
'
' The above copyright notice and this permission notice shall be included in
' all copies or substantial portions of the Software.
'
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
' IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
' FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
' AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
' LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
' OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
' THE SOFTWARE.

Set objIE = CreateObject("InternetExplorer.Application")
objIE.Navigate "about:blank"
Do While objIE.ReadyState <> 4
    WScript.Sleep 20
Loop
Do While objIE.document.readyState <> "complete"
    WScript.Sleep 20
Loop
Set objTextArea = objIE.document.createElement("textarea")
objIE.document.body.appendChild(objTextArea)

Function GetClipBoard()
    objTextArea.select
    objIE.ExecWB 13, 0
    GetClipBoard = objTextArea.value
End Function

Function SetClipBoard(s)
    objTextArea.value = s
    objTextArea.select
    objIE.ExecWB 12, 0
End Function

' Get System Locale info for (partly) I18N support. 
' Will add more languages (Traditional Chinese, Japanese, Korean) in the future.
Set SystemSet = GetObject("winmgmts:").InstancesOf ("Win32_OperatingSystem") 
for each System in SystemSet
  If System.Locale = "0804" Then 
      keepPaused = "保持 Minecraft 处于暂停界面并在此输入聊天内容："
      appName = "Minecraft 中文聊天辅助工具"
    Else
      keepPaused = "Press ESC to pause minecraft and then type in your message here:"
      appName = "Minecraft CJK input Helper"
  End If
next

mcchat_input = InputBox(keepPaused, appName, GetClipBoard())
If mcchat_input <> "" Then
    SetClipBoard(mcchat_input)
    Set WSHShell = CreateObject("WScript.Shell")
    WSHShell.AppActivate "Minecraft" 
    WSHShell.SendKeys "{ESC}"
    WScript.Sleep 250
    WSHShell.SendKeys "t"
    WScript.Sleep 250
    WSHShell.SendKeys "^v"
    WScript.Sleep 250
    WSHShell.SendKeys "~"
End If
