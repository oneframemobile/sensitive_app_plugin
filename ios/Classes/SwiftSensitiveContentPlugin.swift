import Flutter
import UIKit

public class SwiftSensitiveContentPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "sensitive_content", binaryMessenger: registrar.messenger())
    let instance = SwiftSensitiveContentPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method == "hide") {
        result(true)
        DispatchQueue.main.async {
             if let window = UIApplication.shared.windows.first{
                        if let topController = window.visibleViewController() {
                            print(topController)
                            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
                            let blurEffectView = UIVisualEffectView(effect: blurEffect)
                            blurEffectView.frame = topController.view.bounds
                            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                            topController.view.addSubview(blurEffectView)
                        }
                    }
        }
    } else if(call.method == "show") {
        //let root = UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: false, completion: nil)
        DispatchQueue.main.async {
            if let window = UIApplication.shared.windows.first{
                if let topController = window.visibleViewController() {
                    print(topController)
                    if let lastView = topController.view.subviews.last{
                        lastView.removeFromSuperview()
                        result(true)
                    }
                }
            }
            result(false)
        }
    }
  }
}



extension UIWindow {

    func visibleViewController() -> UIViewController? {
        if let rootViewController: UIViewController = self.rootViewController {
            return UIWindow.getVisibleViewControllerFrom(vc: rootViewController)
        }
        return nil
    }

    static func getVisibleViewControllerFrom(vc:UIViewController) -> UIViewController {
        if let navigationController = vc as? UINavigationController,
            let visibleController = navigationController.visibleViewController  {
            return UIWindow.getVisibleViewControllerFrom( vc: visibleController )
        } else if let tabBarController = vc as? UITabBarController,
            let selectedTabController = tabBarController.selectedViewController {
            return UIWindow.getVisibleViewControllerFrom(vc: selectedTabController )
        } else {
            if let presentedViewController = vc.presentedViewController {
                return UIWindow.getVisibleViewControllerFrom(vc: presentedViewController)
            } else {
                return vc
            }
        }
    }
}