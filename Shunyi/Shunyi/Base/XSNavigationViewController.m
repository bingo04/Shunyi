//
//  XSNavigationViewController.m
//  根在修水
//
//  Created by macremote on 13/9/18.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import "XSNavigationViewController.h"

@interface XSNavigationViewController ()

@end

@implementation XSNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

/**
 *  拦截所有控制器的push控制器
 *
 *  @param viewController 即将到来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        //自动隐藏tabbar
        [viewController setHidesBottomBarWhenPushed:YES];

//        viewController.navigationItem.leftBarButtonItem = [self itemWithTarget:self action:@selector(back) image:@"nav_return_normal" highImage:@"nav_return_normal"];
        //
        //        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(more) image:@"navigationbar_more" highImage:@"navigationbar_more_highlighted"];
        
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}


//- (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
//{
    /**
     *  设置返回barButton
//     */
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
//    //设置图片
//    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
//    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
//    //设置尺寸
////    btn.size = btn.currentBackgroundImage.size;
//
//    return [[UIBarButtonItem alloc] initWithCustomView:btn];
//}

@end
