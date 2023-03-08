## Linking xcframework to your flutter Runner

Please follow the following steps to manually link xcframeworks to your flutter Runner.

1. extract `TCCore-Beta.xcframework.zip` from this repo ./res Folder (or from the plugin /ios folder) into your app/ios folder.

2. on terminal, browse to your app/ios folder and run : `pod install`

3. open Runner.xcworkspace inside your app/ios

4. Drag and drop the extracted TCCore.xcframework under your Pods/Frameworks, or simply right click  on Frameworks folder -> `Add files to "Pods" ...`

![](res/1.png?raw=true "Title")

5. uncheck copy files if needed & select all the Commanders act's plugin_targets that your using + the Pods-Runner target

![](res/2.png?raw=true "Title")

6. go to your Pods targets General settings and make sure TCCore.xcframework is there and on Embed & sign for all targets

![](res/3.png?raw=true "Title")

7. now do the same for your Runner Target in the Runner project, add TCCore.xcframework and set it on Embed & sign

![](res/4.png?raw=true "Title")

8. Launch from Xcode, you may launch your app from command line right after. 
