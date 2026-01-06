@echo off
echo Removing Microsoft apps...
adb shell "su -c 'pm uninstall -k --user 0 com.microsoft.office.officehubrow'"
adb shell "su -c 'pm uninstall -k --user 0 com.microsoft.office.excel'"
adb shell "su -c 'pm uninstall -k --user 0 com.microsoft.office.word'"
adb shell "su -c 'pm uninstall -k --user 0 com.microsoft.office.powerpoint'"
adb shell "su -c 'pm uninstall -k --user 0 com.microsoft.skydrive'"
adb shell "su -c 'pm uninstall -k --user 0 com.microsoft.onedrive'"
adb shell "su -c 'pm uninstall -k --user 0 com.microsoft.outlook'"
adb shell "su -c 'pm uninstall -k --user 0 com.samsung.android.wconnect'"
echo Microsoft apps removed.
pause


