#import "SensitiveContentPlugin.h"
#if __has_include(<sensitive_content/sensitive_content-Swift.h>)
#import <sensitive_content/sensitive_content-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "sensitive_content-Swift.h"
#endif

@implementation SensitiveContentPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSensitiveContentPlugin registerWithRegistrar:registrar];
}
@end
