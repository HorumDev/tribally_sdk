import UIKit
import Flutter
import Tribally

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
//    UserService.initApp(projectId: "9eb468c8-358b-4c2e-8659-f17c2225eb6e", apiKey: "tribally_2wwjK3zVYpBwAG-Mb-ALeQROIYVcgEV-")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
