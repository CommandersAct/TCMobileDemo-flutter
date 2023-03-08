# TCMobileDemo-flutter

This is a demo flutter App that uses both commandersAct plugins [TCConsent](https://github.com/CommandersAct/tc-consent-plugin) && [TCServerSide](https://github.com/CommandersAct/tcserverside-plugin)

# SetUp : 
Since Flutter doesn't currently fully support SPM dependencies wich we use to publish our artifact, you'll need to manually link our TCCore.xcframework for both plugins on your xcode app to be able to launch on iOS.

More info here :

[xcframework Linking](https://github.com/CommandersAct/TCMobileDemo-flutter/blob/master/xcframework_linking.md)
