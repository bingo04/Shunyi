//
//  BaseViewController.m
//  Shunyi
//
//  Created by macremote on 2021/4/12.
//

#import "BaseViewController.h"
#import <IQKeyboardManager/IQKeyboardManager.h>

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [IQKeyboardManager sharedManager].toolbarDoneBarButtonItemText = @"完成";
    
    if (self.navigationController) {
        self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
        [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    [IQKeyboardManager sharedManager].toolbarPreviousBarButtonItemText = @"";
    [IQKeyboardManager sharedManager].toolbarNextBarButtonItemText = @"";
    [IQKeyboardManager sharedManager].shouldShowToolbarPlaceholder = NO;
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    
}

@end
