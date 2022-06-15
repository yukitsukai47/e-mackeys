## emackeys
EmacsのキーバインドとmacOSのキーバインドをWindows用に割り当てたものです。  
UNIX配列であるHHKBでの使用を念頭に置いているため、Winキーをmacのcommandキー代わりに扱っています。  

本スクリプトはAutoHotKeyで実行するかコンパイルします。  
AutoHotkey:  
https://www.autohotkey.com/

## 使用方法 (How to use)
emackeys.exeをダブルクリックして起動  

### Windows起動時にアプリを自動起動する場合
C:\Users\ユーザー名\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup  
にemackeys.exeを配置してください。  
win+rでshell:startupを指定しても上記のフォルダを開くことができます。  

## 補足
CapslockとCtrlを入れ替える場合は、Microsoft公式のCtrl2Capを使用してください。  
Ctrl2Cap:  
https://docs.microsoft.com/en-us/sysinternals/downloads/ctrl2cap