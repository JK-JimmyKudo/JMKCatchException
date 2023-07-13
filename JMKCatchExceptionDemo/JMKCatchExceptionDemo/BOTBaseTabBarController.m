//
//  BOTBaseTabBarController.m
//  MFAMobileApp
//
//  Created by ZHAN on 2020/3/2.
//  Copyright © 2020 BotBrain. All rights reserved.
//

#import "BOTBaseTabBarController.h"
#import "ViewController.h"
//#import "BOTNavigationController.h"
//
//#import "BOTHomeViewController.h"
//#import "BOTMyViewController.h"
#import "BOTTranslateViewController.h"
//#import "BOTChatViewController.h"
#define UIImageMake(img) [UIImage imageNamed:img]

@interface BOTBaseTabBarController ()

@end

@implementation BOTBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (instancetype)configTabBarControllers {
    BOTBaseTabBarController *tabBar = [[BOTBaseTabBarController alloc] init];
    tabBar.view.backgroundColor = [UIColor whiteColor];
    tabBar.viewControllers = [self configViewControllers];
    tabBar.tabBar.tintColor = [UIColor blackColor];
    tabBar.tabBar.barTintColor = [UIColor whiteColor];
//    tabBar.tabBar.shadowImage = [UIImage qmui_imageWithColor:[UIColor whiteColor] size:CGSizeMake(100, PixelOne) cornerRadius:0];
    tabBar.tabBar.shadowImage = UIImageMake(@"TabbarLineImage");
//    tabBar.tabBar.backgroundImage = [UIImage qmui_imageWithColor:[UIColor whiteColor]];
    return tabBar;
}


+ (NSArray *)configViewControllers {
    ViewController *homeVC = [[ViewController alloc] init];
    homeVC.hidesBottomBarWhenPushed =  NO;
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    UIImage *homeImage = UIImageMake(@"TabBarItemHome");
    homeNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:homeImage selectedImage:homeImage];
    
    BOTTranslateViewController *translateVC = [[BOTTranslateViewController alloc] init];
    translateVC.hidesBottomBarWhenPushed =  NO;
    UINavigationController *translateNav = [[UINavigationController alloc] initWithRootViewController:translateVC];
    UIImage *translateImage = UIImageMake(@"TabBarItemTranslate");
    translateNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"翻译" image:translateImage selectedImage:translateImage];
    
    ViewController *chatVC = [[ViewController alloc] init];
    chatVC.hidesBottomBarWhenPushed =  NO;
    UINavigationController *chatNav = [[UINavigationController alloc] initWithRootViewController:chatVC];
    UIImage *chatImage = UIImageMake(@"TabBarItemChat");
    chatNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"咨询" image:chatImage selectedImage:chatImage];
    
    ViewController *myVC = [[ViewController alloc] init];
    myVC.hidesBottomBarWhenPushed =  NO;
    UINavigationController *myNav = [[UINavigationController alloc] initWithRootViewController:myVC];
    UIImage *myImage = UIImageMake(@"TabBarItemUser");
    myNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:myImage selectedImage:myImage];
    NSArray *controllerArray = @[homeNav, translateNav, chatNav, myNav];
    return controllerArray;
}

@end
