#import "AppDelegate+Applinks.h"
#import "Applinks.h"

@implementation AppDelegate (Applinks)

/**
 * Handle Universal Links
 */
- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler
{
    // Check if this is a Universal Link
    if (![userActivity.activityType isEqualToString:NSUserActivityTypeBrowsingWeb] || userActivity.webpageURL == nil) {
        // Not a Universal Link, so not handled
        return NO;
    }

    // Send out the notification
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:CDVPluginHandleOpenURLNotification object:userActivity.webpageURL]];

    return YES;
}
@end