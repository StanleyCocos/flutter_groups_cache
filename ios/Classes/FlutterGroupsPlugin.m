#import "FlutterGroupsPlugin.h"
#if __has_include(<flutter_groups/flutter_groups-Swift.h>)
#import <flutter_groups/flutter_groups-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_groups-Swift.h"
#endif

@implementation FlutterGroupsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterGroupsPlugin registerWithRegistrar:registrar];
}
@end
