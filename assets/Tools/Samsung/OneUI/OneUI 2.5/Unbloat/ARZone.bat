@echo off
echo Removing AR Zone apps...
adb shell "su -c 'pm uninstall -k --user 0 com.samsung.android.arsystem'"
adb shell "su -c 'pm uninstall -k --user 0 com.samsung.android.ardrawing'"
adb shell "su -c 'pm uninstall -k --user 0 com.samsung.android.ardrawinghelper'"
adb shell "su -c 'pm uninstall -k --user 0 com.samsung.android.arscene'"
echo Done removing AR Zone apps.
pause