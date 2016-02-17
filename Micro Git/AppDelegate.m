//
//  AppDelegate.m
//  Micro Git
//
//  Created by Home on 2/11/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "AppDelegate.h"
#import <MagicalRecord/MagicalRecord.h>
#import "MicroGitTheme.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [MagicalRecord setupCoreDataStackWithInMemoryStore];
    [MicroGitTheme applyTheme];
    return YES;
}
@end
