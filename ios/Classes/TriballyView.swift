import Flutter
import UIKit
import Tribally

public class TriballyView: NSObject, FlutterPlatformView, UINavigationControllerDelegate
{
private let triballyView: TriballyViewController
public let methodChannel: FlutterMethodChannel!
  public let pluginRegistrar: FlutterPluginRegistrar!

public required init(id: Int64, frame: CGRect, registrar: FlutterPluginRegistrar, params: [String: Any]) {

    self.pluginRegistrar = registrar

    var avatarUrl: URL?
          if let avatar = params["avatar"] as? String {
            avatarUrl = .init(string: avatar)
          }
    self.triballyView = TriballyViewController(
                                 configuration: .init(
                                    projectId: params["projectId"] as! String,
                                    apiKey: params["apiKey"] as! String,
                                    externalId: params["uid"] as! String,
                                    displayName: params["displayName"] as! String,
                                    avatar: avatarUrl
                                 ))
    self.triballyView.view.frame = frame
    
    self.methodChannel = FlutterMethodChannel(
      name: "tribally/tribally_veiw_\(id)",
      binaryMessenger: registrar.messenger()
    )

    super.init()
    self.triballyView.delegate = self
    weak var weakSelf = self
    self.methodChannel.setMethodCallHandler({ weakSelf?.handle($0, result: $1) })

  }
    

  public func view() -> UIView {
      return self.triballyView.view
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

  }

}
