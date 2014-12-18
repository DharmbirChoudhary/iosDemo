//
//  AppDelegate.m
//  Test1
//
//  Created by Andrew on 14/11/27.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:@"有新版本了，是否更新？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==1){
        //itms-services://?action=download-manifest&url=https://fir.im/api/v2/app/install/54699a3d6654fae9570039c4?token=NjV8Y0K7J5EzZv3Rv37PxzHh1fNroAxSGoOeeVYz
        NSURL*url= [NSURL URLWithString:@"itms-services://?action=download-manifest&url=https%3A%2F%2Ffir.im%2Fapi%2Fv2%2Fapp%2Finstall%2F54699a3d6654fae9570039c4%3Ftoken%3DNjV8Y0K7J5EzZv3Rv37PxzHh1fNroAxSGoOeeVYz"];
        [[UIApplication sharedApplication] openURL:url];
    }
}

@end
