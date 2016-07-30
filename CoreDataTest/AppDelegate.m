//
//  AppDelegate.m
//  CoreDataTest
//
//  Created by duck on 16/7/31.
//  Copyright © 2016年 duck. All rights reserved.
//

#import "AppDelegate.h"
#import "MagicalRecord.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"MydataBase"];
    return YES;
}
- (void)applicationWillTerminate:(NSNotification *)aNotification{
    [MagicalRecord cleanUp];
}

@end
