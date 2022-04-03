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

    var settings = params["settings"] as! [String: Any]
    var viewOptions = params["viewOptions"] as! [String: Any]

    var avatarUrl: URL?
          if let avatar = settings["avatar"] as? String {
            avatarUrl = .init(string: avatar)
          }
    self.triballyView = TriballyViewController(
                                 configuration: .init(
                                    projectId: settings["projectId"] as! String,
                                    apiKey: settings["apiKey"] as! String,
                                    externalId: settings["uid"] as! String,
                                    displayName: settings["displayName"] as! String,
                                    avatar: avatarUrl
                                    ),
                                    themeProvider: .init(
                                        primary: UIColor(hexString: viewOptions["primary"] as! String),
                                        background: UIColor(hexString: viewOptions["background"] as! String),
                                        surface: UIColor(hexString: viewOptions["surface"] as! String),
                                        text: UIColor(hexString: viewOptions["text"] as! String),
                                    	divider: UIColor(hexString: viewOptions["divider"] as! String),
                                    	primaryDark: UIColor(hexString: viewOptions["primaryDark"] as! String)
                                    )
                                 )
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

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8 * 17), (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
