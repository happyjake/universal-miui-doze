#!/data/adb/magisk/busybox sh
set -o standalone

#
# Universal MIUI Doze by the
# open-source loving GL-DP and all contributors;
# Patches MIUI services app and certain processes/services to be able to use battery optimization
#

(   
# Wait until boot completed
until [ $(resetprop sys.boot_completed) -eq 1 ] &&
[ -d /sdcard ]; do
sleep 100
done

# MIUI components
MIUI="com.google.android.MIUI"
GC1="auth.managed.admin.DeviceAdminReceiver"
GC2="mdm.receivers.MdmDeviceAdminReceiver"
NLL="/dev/null"

# Disable collective device administrators
for U in $(ls /data/user); do
for C in $GC1 $GC2 $GC3; do
pm disable --user $U "$MIUI/$MIUI.$C" &> $NLL
done
done

# Add MIUI to battery optimization
dumpsys deviceidle whitelist -com.xiaomi.market
dumpsys deviceidle whitelist -com.miui.cloudbackup
dumpsys deviceidle whitelist -com.miui.cloudservice
dumpsys deviceidle whitelist -com.miui.micloudsync
dumpsys deviceidle whitelist -com.miui.weather2
dumpsys deviceidle whitelist -com.lbe.security.miui
dumpsys deviceidle whitelist -com.eg.android.AlipayGphone
dumpsys deviceidle whitelist -com.miui.gallery
dumpsys deviceidle whitelist -com.xiaomi.account
dumpsys deviceidle whitelist -com.unionpay.tsmservice.mi

exit 0
)
