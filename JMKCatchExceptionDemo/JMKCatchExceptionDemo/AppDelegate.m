//
//  AppDelegate.m
//  JMKCatchExceptionDemo
//
//  Created by li on 2023/7/13.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "JMKCatchExceptionTool.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//        ViewController *vc = [[ViewController alloc]init];
//        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
//        self.window.rootViewController = nav;
//        self.window.backgroundColor = [UIColor whiteColor];
//        [self.window makeKeyAndVisible];
        
    
    
    
    
    [self createRootViewController];
    
    //register
    [[JMKCatchExceptionTool shareInstance]installUncaughtExceptionHandler];

    return YES;
}

- (void)createRootViewController {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window = window;
    self.tabBarController = [BOTBaseTabBarController configTabBarControllers];
    self.tabBarController.delegate = self;
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
}
#pragma mark - UISceneSession lifecycle

//
//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
