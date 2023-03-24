## Linking xcframework to your flutter Runner

Please follow the following steps to manually link xcframeworks to your flutter Runner.

1. on terminal, browse to your app/ios folder and run : `pod install`

2. open Runner.xcworkspace inside your app/ios/

3. go to your Pods targets General settings and add TCCore.xcframework (you will find it in under your Pods Project) with Embed & sign for all CommandersAct plugins targets

![](res/1.png?raw=true "Title")

![](res/2.png?raw=true "Title")

8. Launch from Xcode, you may launch your app from command line right after. 
