import UIKit
import tc_serverside_plugin
import Flutter
import AppTrackingTransparency
import AdSupport
import FirebaseCore
import FirebaseAnalytics
import tc_consent_plugin

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, TCFirebaseConsentDelegate, TCFirebaseAnalyticsDelegate {

    override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        FirebaseApp.configure()
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    func firebaseConsentChanged(_ firebaseConsent: [String : NSNumber]!)
    {
        if let analytics_storage_consent = firebaseConsent["analytics_storage"]?.boolValue{
            Analytics.setConsent([.analyticsStorage: analytics_storage_consent ? .granted : .denied])
        }
        
        if let ad_storage_consent = firebaseConsent["ad_storage"]?.boolValue{
            Analytics.setConsent([.adStorage: ad_storage_consent ? .granted : .denied])
        }

        if let ad_user_data_consent = firebaseConsent["ad_user_data"]?.boolValue{
            Analytics.setConsent([.adUserData: ad_user_data_consent ? .granted : .denied])
        }

        if let ad_personalization_consent = firebaseConsent["ad_personalization"]?.boolValue{
            Analytics.setConsent([.adPersonalization: ad_personalization_consent ? .granted : .denied])
        }
    }
    
    func getFirebaseAnalyticsInstace() -> Any! {
        return Analytics.self
    }
}
