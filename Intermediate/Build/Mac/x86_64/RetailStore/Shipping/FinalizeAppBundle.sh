#!/bin/sh
cd "/Users/li.skye/Downloads/RetailStore v2/Binaries/Mac"
mkdir -p "RetailStore-Mac-Shipping.app/Contents/MacOS"
mkdir -p "RetailStore-Mac-Shipping.app/Contents/Resources"
rsync --checksum "/Users/Shared/Epic Games/UE_5.0/Engine/Source/Runtime/Launch/Resources/Mac/UnrealEngine.icns" "RetailStore-Mac-Shipping.app/Contents/Resources/RetailStore.icns"
rsync --checksum "/Users/Shared/Epic Games/UE_5.0/Engine/Source/Runtime/Launch/Resources/Mac/Info.plist" "$TMPDIR/TempInfo.plist"
/usr/bin/sed -i "" -e "s/\${EXECUTABLE_NAME}/RetailStore-Mac-Shipping/g" "$TMPDIR/TempInfo.plist"
/usr/bin/sed -i "" -e "s/\${APP_NAME}/com.YourCompany.RetailStore/g" "$TMPDIR/TempInfo.plist"
/usr/bin/sed -i "" -e "s/\${MACOSX_DEPLOYMENT_TARGET}/10.15.7/g" "$TMPDIR/TempInfo.plist"
/usr/bin/sed -i "" -e "s/\${ICON_NAME}/RetailStore/g" "$TMPDIR/TempInfo.plist"
/usr/bin/sed -i "" -e "s/\${BUNDLE_VERSION}/5.0.2/g" "$TMPDIR/TempInfo.plist"
rsync --checksum "$TMPDIR/TempInfo.plist" "RetailStore-Mac-Shipping.app/Contents/Info.plist"
chmod 644 "RetailStore-Mac-Shipping.app/Contents/Info.plist"
echo 'echo -n "APPL????"' | bash > "$TMPDIR/TempPkgInfo"
rsync --checksum "$TMPDIR/TempPkgInfo" "RetailStore-Mac-Shipping.app/Contents/PkgInfo"
touch -c "RetailStore-Mac-Shipping.app"
