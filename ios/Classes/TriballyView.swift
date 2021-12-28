import Flutter
import UIKit
import Tribally

public class TriballyView: NSObject, FlutterPlatformView
{
private let triballyView: TriballyViewController
public let methodChannel: FlutterMethodChannel!
  public let pluginRegistrar: FlutterPluginRegistrar!

public required init(id: Int64, frame: CGRect, registrar: FlutterPluginRegistrar, params: [String: Any]) {
print("TriballyView init here")
    self.pluginRegistrar = registrar
    //if params["projectId"] != nil {
    self.triballyView = TriballyViewController(
                                 configuration: .init(
                                    projectId: params["projectId"] as! String,
                                    apiKey: params["apiKey"] as! String,
                                    externalId: params["uid"] as! String,
                                    displayName: params["displayName"] as! String
                                    //avatar: .init(string: "Avatar image URL(optional)")
                                 ))
    //}
    self.methodChannel = FlutterMethodChannel(
      name: "tribally/tribally_veiw_\(id)",
      binaryMessenger: registrar.messenger()
    )

    super.init()

    weak var weakSelf = self
    self.methodChannel.setMethodCallHandler({ weakSelf?.handle($0, result: $1) })

  }

  public func view() -> UIView {
      return self.triballyView.view
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

  }
}
