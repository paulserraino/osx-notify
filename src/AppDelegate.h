#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface AppDelegate : NSObject<NSUserNotificationCenterDelegate>

@property (nonatomic, assign) BOOL keepRunning;
- (void) notify;
@end
