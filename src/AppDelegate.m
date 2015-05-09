#include "AppDelegate.h"

/**
* Override the default NSBundle
*
*/
NSString *fakeBundleIdentifier = nil;

@implementation NSBundle(swizle)

- (NSString *)__bundleIdentifier {
    if (self == [NSBundle mainBundle]) {
        return fakeBundleIdentifier ? fakeBundleIdentifier : @"com.apple.finder";
    } else {
        return [self __bundleIdentifier];
    }
}

@end

BOOL installNSBundleHook() {
  Class class = objc_getClass("NSBundle");
  if ( class ) {
    method_exchangeImplementations(
      class_getInstanceMethod( class, @selector(bundleIdentifier) )
    , class_getInstanceMethod( class, @selector(__bundleIdentifier) )
    );
    return YES;
  }
  return NO;
}

/**
*	Define the application delegate
*
*/
@implementation AppDelegate

- (void) userNotificationCenter:(NSUserNotificationCenter *)center didDeliverNotification:(NSUserNotification *)notification
{
self.keepRunning = NO;
}

/**
* notify
*
*/
- (void) notify {
   if ( installNSBundleHook() ) {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    fakeBundleIdentifier = [defaults stringForKey:@"identifier"];
    
    NSUserNotificationCenter *nc = [NSUserNotificationCenter defaultUserNotificationCenter];
    AppDelegate *ncDelegate = [[AppDelegate alloc]init];
    ncDelegate.keepRunning = YES;
    nc.delegate = ncDelegate;
    
    NSUserNotification *note = [[NSUserNotification alloc] init];
    note.title = [defaults stringForKey:@"title"];
    note.subtitle = [defaults stringForKey:@"subtitle"];
    note.informativeText = [defaults stringForKey:@"informativeText"];
    
    if (!(note.title || note.subtitle || note.informativeText)) {
        note.title = @"Usage: usernotification";
        note.informativeText = @"Options: [-identifier <IDENTIFIER>] [-title <TEXT>] [-subtitle TEXT] [-informativeText TEXT]";
    }
    
    [nc deliverNotification:note];
    
    while (ncDelegate.keepRunning) {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    }
  }
}

@end
