//
//  RegisterViewController.h
//  IIIUI-0.1
//
//  Created by yangpeng on 10/9/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserAccount.h"

@interface RegisterViewController : UIViewController<UITextFieldDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIVideoEditorControllerDelegate>


@property(nonatomic, strong) MBProgressHUD *hud;
@property(nonatomic, strong) IBOutlet UITextField *usernametf;
@property(nonatomic, strong) IBOutlet UITextField *passwordtf;

@property(nonatomic, strong) IBOutlet UIButton *regBtn;
@property(nonatomic, strong) UIImagePickerController *ipc;
@property(nonatomic, strong) UITabBarController *tabbar;

@property(nonatomic, copy) UserAccount *userAccount;


@end
