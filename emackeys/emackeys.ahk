#InstallKeybdHook
#UseHook

SetKeyDelay 0

ctrl_x = 0
markset = 0

; Exclusion
SetTitleMatchMode,  2
GroupAdd, exclusion, ahk_exe emacs.exe
GroupAdd, exclusion, ahk_exe DeadByDaylight.exe
GroupAdd, exclusion, ahk_exe kali.exe
GroupAdd, exclusion, ahk_exe ubuntu2004.exe
GroupAdd, exclusion, ahk_exe ubuntu2204.exe
GroupAdd, exclusion, ahk_exe WindowsTerminal.exe

#IfWinNotActive ahk_group exclusion

delete_char()
{
  Send {Del}
  global markset = 0
  Return
}
delete_backward_char()
{
  Send {BS}
  global markset = 0
  Return
}
delete_word()
{
  global markset = 1
  if markset
      Send +^{Right}{BS}
      global markset = 0
}
kill_line()
{
  Send {Shift Down}{End}{Shift Up}
  Sleep 50
  Send ^x
  global markset = 0
  Return
}
quit()
{
  Send {ESC}
  global markset = 0
  Return
}
newline()
{
  Send {Enter}
  global markset = 0
  Return
}
isearch()
{
  Send ^f
  global markset = 0
  Return
}
kill_region()
{
  Send ^x
  global markset = 0
  Return
}
copy()
{
  Send ^c
  global markset = 0
  Return
}
yank()
{
  Send ^v
  global markset = 0
  Return
}
undo()
{
  Send ^z
  global markset = 0
  Return
}
redo()
{
  Send ^y
  global markset = 0
  Return
}
find_file()
{
  Send ^o
  global ctrl_x = 0
  Return
}
save_buffer()
{
  Send, ^s
  global ctrl_x = 0
  Return
}
move_beginning_of_line()
{
  global
  if markset
    Send +{HOME}
  Else
    Send {HOME}
  Return
}
move_end_of_line()
{
  global
  if markset
    Send +{END}
  Else
    Send {END}
  Return
}
previous_line()
{
  global
  if markset
    Send +{Up}
  Else
    Send {Up}
  Return
}
next_line()
{
  global
  if markset
    Send +{Down}
  Else
    Send {Down}
  Return
}
forward_char()
{
  global
  if markset
    Send +{Right}
  Else
    Send {Right}
  Return
}
backward_char()
{
  global
  if markset
    Send +{Left} 
  Else
    Send {Left}
  Return
}
forward_word()
{
  global
  if markset
    Send +^{Right}
  Else
    Send ^{Right}
  Return
}
backward_word()
{
  global
  if markset
    Send +^{Left} 
  Else
    Send ^{Left}
  Return
}
mark_whole_buffer()
{
  Send, ^a
  global ctrl_x = 0
  Return
}

^@::
If markset
  markset = 0
Else
  markset = 1
Return

^x::
ctrl_x = 1
Return 

^s::
If ctrl_x
  save_buffer()
Else
  isearch()
Return

^f::
If ctrl_x
  find_file()
Else
  forward_char()
Return

h::
If ctrl_x
  mark_whole_buffer()
Else
  Send h
Return

^d::delete_char() Return
^h::delete_backward_char() Return
!d::delete_word() Return
^k::kill_line() Return
^g::quit() Return
^m::newline() Return
^w::kill_region() Return
!w::copy() Return
^y::yank() Return
^/::undo() Return
!/::redo() Return  
^a::move_beginning_of_line() Return
^e::move_end_of_line() Return
^p::previous_line() Return
^n::next_line() Return
^b::backward_char() Return
!f::forward_word() Return
!b::backward_word() Return

LWin & c::Send, ^c
LWin & v::Send, ^v
LWin & s::Send, ^s
LWin & z::Send, ^z
LWin & f::Send, ^f
LWin & a::Send, ^a
LWin & w::Send, ^w
LWin & p::Send, ^p
LWin & Space::Send, #s
LWin & /::Send, #v
#+4::Send, #+s

#IfWinNotActive ahk_group exclusion