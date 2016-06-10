//
//  PHYTabBarController.m
//  PanHuApp
//
//  Created by apple on 16/6/10.
//  Copyright © 2016年 戴维营学习. All rights reserved.
//

#import "PHYTabBarController.h"
#import "PHYNavigationController.h"

#import "PHYHomeViewController.h"
#import "PHYBuyViewController.h"
#import "PHYMessageViewController.h"
#import "PHYMeViewController.h"
#import "PHYConstants.h"

@interface PHYTabBarController ()

@end

@implementation PHYTabBarController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
        normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:14];
        normalAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
        
        NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
        selectedAttrs[NSFontAttributeName] = normalAttrs[NSFontAttributeName];
        selectedAttrs[NSForegroundColorAttributeName] = normalAttrs[NSForegroundColorAttributeName];
        
        UITabBarItem *item = [UITabBarItem appearance];
        [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
        [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
        self.tabBarItem = item;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*!
     *  初始化导航栏控制器
     */
    PHYNavigationController *homeNavCtrl = [self createNavigationController:[PHYHomeViewController new] title:@"首页" image:tabBarHomeNorIcon selectedImage:tabBarHomeSelIcon];
    PHYNavigationController *buyNavCtrl = [self createNavigationController:[PHYBuyViewController new] title:@"买" image:tabBarBuyNorIcon selectedImage:tabBarBuySelIcon];
    PHYNavigationController *messageNavCtrl = [self createNavigationController:[PHYMessageViewController new] title:@"消息" image:tabBarMesNorIcon selectedImage:tabBarMesSelIcon];
    PHYNavigationController *meNavCtrl = [self createNavigationController:[PHYMeViewController new] title:@"我" image:tabBarMeNorIcon selectedImage:tabBarMeSelIcon];
    
    UIViewController *addViewCtrl = [[UIViewController alloc]init];
    addViewCtrl.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);//设置图标居中
    addViewCtrl.tabBarItem.image = [[UIImage imageNamed:tabBarAddNorIcon] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    addViewCtrl.tabBarItem.selectedImage = [[UIImage imageNamed:tabBarAddSelIcon] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.viewControllers = @[homeNavCtrl, buyNavCtrl, addViewCtrl, messageNavCtrl, meNavCtrl];
}

/**
 *  初始化控制器
 */
- (PHYNavigationController *)createNavigationController:(UIViewController *)viewController title:(NSString *)title image:(NSString *)normalImage selectedImage:(NSString *)selectedImage {
    
    if ([title isEqualToString:@"我"]) {
        
        viewController.tabBarItem.badgeValue = @"";//设置消息提醒
    }
   
    // 设置文字图片
    viewController.tabBarItem.title = title;
    viewController.tabBarItem.image = [[UIImage imageNamed:normalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 初始化导航控制器
    PHYNavigationController *navCtrl = [[PHYNavigationController alloc]initWithRootViewController:viewController];
    
    return navCtrl;
}

@end
