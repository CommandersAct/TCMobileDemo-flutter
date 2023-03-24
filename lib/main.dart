import 'package:flutter/material.dart';
import 'package:my_app/MockEvents.dart';
import 'package:tc_serverside_plugin/tc_serverside.dart';
import 'package:tc_consent_plugin/tc_consent.dart';
import 'package:tccore_plugin/TCUser.dart';
import 'package:tccore_plugin/TCDebug.dart';
import 'package:tc_serverside_plugin/TCDevice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TCServerside serverside = TCServerside();
  TCConsent consent = TCConsent();

  var SITE_ID = 3311;
  var PRIVACY_ID = 72;
  var mockConsent = {"PRIVACY_CAT_10007": "1", "PRIVACY_CAT_31": "0", "PRIVACY_CAT_10014": "0", "PRIVACY_VEN_2": "0", "PRIVACY_CAT_10019": "0", "PRIVACY_VEN_1": "1"};


  @override
  void initState() {
    super.initState();
    serverside.initServerSide(3311, "sourceKey");
    consent.setSiteIDPrivacyID(3311, 07);
  }
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:Container(
      child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildRedButton('Enable logging', () => {TCDebug().setDebugLevel(TCLogLevel.TCLogLevel_Verbose)} ),
                buildRedButton('Disable logging', () => {TCDebug().setDebugLevel(TCLogLevel.TCLogLevel_None)} ),
                buildTextButton('BreakPoint', breakpoint),
                buildTextButton('addPermanentData', () => {serverside.addPermanentData("permanant_data_key", "permanant_value")}),
                buildTextButton('enableRunningInBackground', () => {serverside.enableRunningInBackground()}),
                buildTextButton('getPermanentData', () async => {print(" *- permanant data = ${await serverside.getPermanentData("permanant_data_key")}")}),
                buildTextButton('removePermanentData', () async => {print(" *- removed data = ${await serverside.removePermanentData("permanant_data_key")}")}),
                buildTextButton('addAdvertisingID', () => {serverside.addAdvertisingID()}),
                buildTextButton('PageViewEvent', () => {serverside.execute(MockEvents.makeMockTCPageViewEvent())}),
                buildTextButton('TCPurchaseEvent', () => {serverside.execute(MockEvents.makeMockTCPurchaseEvent())}),
                buildTextButton('TCAddShippingInfoEvent', () => {serverside.execute(MockEvents.makeTCAddShippingInfoEvent())}),
                buildTextButton('TCAddPaymentInfoEvent', () => {serverside.execute(MockEvents.makeMockTCAddPaymentInfoEvent())}),
                buildTextButton('TCAddToCartEvent', () => {serverside.execute(MockEvents.makeMockTCAddToCartEvent())}),
                buildTextButton('TCAddToWishlistEvent', () => {serverside.execute(MockEvents.makeMockTCAddToWishlistEvent())}),
                buildTextButton('TCRefundEvent', () => {serverside.execute(MockEvents.makeMockTCRefundEvent())}),
                buildTextButton('TCRemoveFromCartEvent', () => {serverside.execute(MockEvents.makeMockTCRemoveFromCartEvent())}),
                buildTextButton('TCBeginCheckoutEvent', () => {serverside.execute(MockEvents.makeMockTCBeginCheckoutEvent())}),
                buildTextButton('TCViewCartEvent', () => {serverside.execute(MockEvents.makeMockTCViewCartEvent())}),
                buildTextButton('TCViewItem', () => {serverside.execute(MockEvents.makeMockTCViewItem())}),
                buildTextButton('TCCustomEvent', () => {serverside.execute(MockEvents.makeMockTCCustomEvent())}),
                buildTextButton('TCSelectContentEvent', () => {serverside.execute(MockEvents.makeMockTCSelectContentEvent())}),
                buildTextButton('TCSignUpEvent', () => {serverside.execute(MockEvents.makeMockTCSignUpEvent())}),
                buildTextButton('TCSearchEvent', () => {serverside.execute(MockEvents.makeMockTCSearchEvent())}),
                buildTextButton('TCLoginEvent', () => {serverside.execute(MockEvents.makeMockTCLoginEvent())}),
                buildTextButton('TCGenerateLeadEvent', () => {serverside.execute(MockEvents.makeMockTCGenerateLeadEvent())}),
                buildTextButton('TCSelectItemEvent', () => {serverside.execute(MockEvents.makeMockTCSelectItemEvent())}),
                buildTextButton('TCViewItemListEvent', () => {serverside.execute(MockEvents.makeMockTCViewItemListEvent())}),


                //TCConsent
                buildRedButton('Accept All Consent', consent.acceptAllConsent ),
                buildRedButton('Refuse all consent', consent.refuseAllConsent ),
                buildRedButton('Show Privacy Center', consent.showPrivacyCenter ),
                buildRedButton('Call use AC String',() {consent.useACString(true);} ),
                buildRedButton('Init with Custom Privacy Center',() {consent.initWithCustomPCM(SITE_ID, PRIVACY_ID);} ),
                buildRedButton('Use custom Publisher restrictions',() {consent.useCustomPublisherRestrictions();} ),
                buildRedButton('Set Consent Duration',() {consent.setConsentDuration(6);} ),
                buildRedButton('saveConsentFromPopUp',() {consent.saveConsentFromPopUp(mockConsent);}),
                buildRedButton('saveConsent',() {consent.saveConsent(mockConsent);}),
                buildRedButton('saveConsentFromConsentSourceWithPrivacyAction',() {consent.saveConsentFromConsentSourceWithPrivacyAction(mockConsent, ETCConsentSource.popUp, ETCConsentAction.save);}),
                buildRedButton('statEnterPCToVendorScreen',consent.statEnterPCToVendorScreen),
                buildRedButton('statShowVendorScreen',consent.statShowVendorScreen),
                buildRedButton('statViewPrivacyPoliciesFromPrivacyCenter',consent.statViewPrivacyPoliciesFromPrivacyCenter),
                buildRedButton('statViewPrivacyCenter',consent.statViewPrivacyCenter),
                buildRedButton('statViewBanner',consent.statViewBanner),
                buildRedButton('resetSavedConsent',consent.resetSavedConsent),
                buildRedButton('statViewPrivacyPoliciesFromBanner',consent.statViewPrivacyPoliciesFromBanner),
                buildRedButton('setLanguage',() {consent.setLanguage("fr");}),
                buildRedButton('getConsentAsJson',() async {
                  var savedConsent = await consent.getConsentAsJson();
                  print("savedconsent = ${savedConsent}");
                })

              ],
            ),
          )
      ),
    )
      ,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void breakpoint()
  {
    TCUser();
    print("");
  }

  Container buildTextButton(String label, Function() f) {
    return     Container(
        margin: const EdgeInsets.only(top: 10.0, right: 34, left: 34),
        child : ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                minimumSize: const Size.fromHeight(50)),
            onPressed: () {f();},
            child: Text(
              label, style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,

            )));
  }

  Container buildRedButton(String label, Function() f) {
    return     Container(
        margin: const EdgeInsets.only(top: 10.0, right: 34, left: 34),
        child : ElevatedButton(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple,
                minimumSize: const Size.fromHeight(50)),
            onPressed: () {f();},
            child: Text(
              label, style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,

            )));
  }
}
