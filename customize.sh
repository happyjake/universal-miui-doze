#!/data/adb/magisk/busybox sh
set -o standalone

set -x

#
# Universal MIUI Doze by the
# open-source loving GL-DP and all contributors;
# Patches MIUI services app and certain processes/services to be able to use battery optimization
#

# Additional add-on for check MIUI status
ADDON() {
 ui_print "- Inflating add-on file"
mkdir -p $MODPATH/system/bin
mv -f $MODPATH/miuic $MODPATH/system/bin/miuic
}

FINALIZE() {
 ui_print "- Finalizing installation"

# Clean up
 ui_print "  Cleaning obsolete files"
find $MODPATH/* -maxdepth 0 \
! -name 'module.prop' \
! -name 'post-fs-data.sh' \
! -name 'service.sh' \
! -name 'system' \
-exec rm -rf {} \;

# Settings dir and file permission
 ui_print "  Settings permissions"
set_perm_recursive $MODPATH 0 0 0755 0755
set_perm $MODPATH/system/bin/miuic 0 2000 0755
}

# Final adjustment
ADDON && FINALIZE
