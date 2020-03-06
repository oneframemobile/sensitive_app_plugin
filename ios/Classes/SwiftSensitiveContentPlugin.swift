import Flutter
import UIKit

public class SwiftSensitiveContentPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "sensitive_content", binaryMessenger: registrar.messenger())
    let instance = SwiftSensitiveContentPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    DispatchQueue.main.async {
        let alert = UIAlertController(title: "Alert", message: "Hi, My name is flutter", preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        let controller = UIViewController()
        controller.view.backgroundColor = UIColor.black

        UIApplication.shared.keyWindow?.rootViewController?.present(controller, animated: true, completion: nil);
    }
  }
}
