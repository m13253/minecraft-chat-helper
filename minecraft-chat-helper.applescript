-- The MIT License (MIT)
--
-- Copyright (c) 2014 Star Brilliant <m13253@hotmail.com>
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.

set mcchat_clipboard to ""
try
	set mcchat_clipboard to the clipboard
end try
set mcchat_input to (display dialog "保持 Minecraft 处于暂停界面并在此输入聊天内容：" with title "Minecraft 中文聊天辅助工具" default answer mcchat_clipboard)
set the clipboard to mcchat_input
try
	activate application "Minecraft"
end try
tell application "System Events"
	delay 0.25
	key code 53 -- escape
	delay 0.25
	keystroke "t"
	delay 0.25
	keystroke "v" using control down
	delay 0.25
	keystroke return
end tell
