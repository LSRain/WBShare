//
//  AppDelegate.m
//  WBShare
//
//  Created by WangBiao on 2016/11/27.
//  Copyright © 2016年 lsrain. All rights reserved.
//

#import "AppDelegate.h"
#import <UMSocialCore/UMSocialCore.h>


@interface AppDelegate ()

@end

/*!
 出于账号安全考虑，此处没有给出对应的key
 使用前，请自己获取一个友盟的appKey、新浪appKey、以及appSecret
 并在下列进行设置
 */
/////////////////////////////////////////////////////////////////////////////
//使用前设置key--start
/////////////////////////////////////////////////////////////////////////////

/// 友盟appkey
NSString *wbUAppKey = @"";
/// 新浪的appKey
NSString *wbSAppKey = @"";
/// appSecret
NSString *wbSAppSecret = @"";

/////////////////////////////////////////////////////////////////////////////
//使用前设置key--end
/////////////////////////////////////////////////////////////////////////////

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //打开调试日志
    [[UMSocialManager defaultManager] openLog:YES];
    
    //设置友盟appkey
    [[UMSocialManager defaultManager] setUmSocialAppkey:wbUAppKey];
    
    // 获取友盟social版本号
    //NSLog(@"UMeng social version: %@", [UMSocialGlobal umSocialSDKVersion]);
    
    //设置新浪的appKey和appSecret
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:wbSAppKey  appSecret:wbSAppSecret redirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
    return YES;
}

// SDK回调
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url];
    if (!result) {
        // 其他如支付等SDK的回调
    }
    return result;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
