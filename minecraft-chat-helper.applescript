-- The MIT License (MIT)
--
-- Copyright (c) 2014 Star Brilliant <m13253@hotmail.com>
-- Copyright (c) 2014 Lancelot Fong <ilbfy08@gmail.com>
-- Copyright (c) 2014 Arthur200000 <crashedsystem67@gmail.com> 
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

set user_locale to user locale of (get system info)
--get locale name.

if user_locale = "zh*" then
	set keepPaused to "±£≥÷ Minecraft ¥¶”⁄‘›Õ£ΩÁ√Ê≤¢‘⁄¥À ‰»Î¡ƒÃÏƒ⁄»›£∫"
	set appName to "Minecraft ÷–Œƒ¡ƒÃÏ∏®÷˙π§æﬂ"
else
	set keepPaused to "Press ESC to pause minecraft and then type in your message here:"
	set appName to "Minecraft CJK input Helper"
end if
-- All kinds of Chinese in just one expressionˇ.WTF 
-- So we will have something like kr* ja* en* ˇˇ

set mcchat_clipboard to ""
try
	set mcchat_clipboard to the clipboard
end try
set mcchat_input to the text returned of (display dialog "±£≥÷ Minecraft ¥¶”⁄‘›Õ£ΩÁ√Ê≤¢‘⁄¥À ‰»Î¡ƒÃÏƒ⁄»›£∫" with title "Minecraft ÷–Œƒ¡ƒÃÏ∏®÷˙π§æﬂ" default answer mcchat_clipboard)
set the clipboard to mcchat_input
tell application "System Events"
	delay 0.25
	keystroke tab using command down
	delay 0.5
	key code 53 -- escape
	delay 0.25
	keystroke "t"
	delay 0.25
	keystroke "v" using control down
	delay 0.25
	keystroke return
end tell