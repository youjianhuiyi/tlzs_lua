@echo off
color 0a
git pull
ping 127.0.0.1
copy /Y  "%~dp0"userdefine\script\自定义\ "D:\天龙好帮手\script\自定义\" /A