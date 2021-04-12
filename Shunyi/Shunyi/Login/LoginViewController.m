//
//  LoginViewController.m
//  Shunyi
//
//  Created by macremote on 2021/4/12.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *mobileTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageview;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"登录";
    self.loginButton.layer.cornerRadius = 5.0;
    self.loginButton.layer.masksToBounds = YES;
}

#pragma mark - 登录
- (IBAction)loginButtonClickAction:(UIButton *)sender {
    
}

#pragma mark - 创建账号
- (IBAction)createButtonClickAction:(UIButton *)sender {
    
}

#pragma mark - 忘记密码
- (IBAction)forgotButtonClickAction:(UIButton *)sender {
    
}

@end
