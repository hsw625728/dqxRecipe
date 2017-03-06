//
//  AppDelegate.m
//  dqxRecipe
//
//  Created by SHAOWENn HAN on 16/11/23.
//  Copyright © 2016年 mengyoutu.cn. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewControllers/TabBar/DRTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //创建主窗口
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    //设置导航栏的样式
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : DRNavigationBarTitleTextColor}];
    [[UINavigationBar appearance] setTintColor:DRLightGrayTextColor];
    //[[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:DRNavigationBarTitleTextColor];
    
    
    _window.rootViewController = [[DRTabBarController alloc] init];
    
    
    //开屏广告
    /*
    GDTSplashAd *splash = [[GDTSplashAd alloc] initWithAppkey:@"1105943570" placementId:@"5040915864189141"];
    splash.delegate = self; //设置代理
    //根据iPhone设备不同设置不同背景图
    
     if ([[UIScreen mainScreen] bounds].size.height >= 568.0f) {
     splash.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"LaunchImage-568h"]];
     } else {
     splash.backgroundColor = [UIColor colorWithPatternImage:[UIImage
     imageNamed:@"LaunchImage"]]; }
     
    splash.fetchDelay = 6; //开发者可以设置开屏拉取时间,超时则放弃展示
    //[可选]拉取并展示全屏开屏广告
    [splash loadAdAndShowInWindow:self.window];
    self.splash = splash;
    */
    
    return YES;
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
    [self.splash loadAdAndShowInWindow:self.window];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
