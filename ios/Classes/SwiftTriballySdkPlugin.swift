import Flutter
import UIKit
import Tribally

public class SwiftTriballySdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
//     let channel = FlutterMethodChannel(name: "tribally", binaryMessenger: registrar.messenger())
//     let instance = SwiftTriballySdkPlugin()
//     registrar.addMethodCallDelegate(instance, channel: channel)
registrar.register(
      TriballyFactory(registrar: registrar),
      withId: "tribally"
    )
  }

}
