//
//  XSMainTabBarController.m
//  根在修水
//
//  Created by macremote on 13/9/18.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import "XSMainTabBarController.h"

#import "XSTabBar.h"

@interface XSMainTabBarController ()

@end

@implementation XSMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupItem];

    [self setValue:[[XSTabBar alloc] init] forKeyPath:@"tabBar"];
}

- (void)setupItem
{
    // UIControlStateNormal状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    // 文字颜色
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    // 文字大小
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    
    // UIControlStateSelected状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    // 文字颜色
    selectedAttrs[NSForegroundColorAttributeName] = M18_COLOR_HEX(0x43b8a3);
    
    // 统一给所有的UITabBarItem设置文字属性
    // 只有后面带有UI_APPEARANCE_SELECTOR的属性或方法, 才可以通过appearance对象来统一设置
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

@end
