//
//  LoginViewController.h
//  IIIUI-0.1
//
//  Created by yangpeng on 10/8/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserAccount.h"

@interface LoginViewController : UIViewController<UITabBarControllerDelegate, UITextFieldDelegate>

@property(nonatomic, strong) MBProgressHUD *hud;
@property(nonatomic, strong) UILabel *usernamelab;
@property(nonatomic, strong) UILabel *passwordlab;
@property(nonatomic, strong) IBOutlet UITextField *usernametf;
@property(nonatomic, strong) IBOutlet UITextField *passwordtf;

@property(nonatomic, strong) IBOutlet UIButton *forgetBtn;
@property(nonatomic, strong) IBOutlet UIButton *regBtn;
@property(nonatomic, strong) UITabBarController *tabbar;

@property(nonatomic, copy) UserAccount *userAccount;
@property(nonatomic, strong) IBOutlet UIScrollView *logsv;


@property(nonatomic, strong) UIImagePickerController *ipc;


-(IBAction)forgetMeth:(id)sender;
-(void)login;
-(IBAction)goRegisterView:(id)sender;

@end
