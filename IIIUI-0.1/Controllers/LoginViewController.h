//
//  LoginViewController.h
//  IIIUI-0.1
//
//  Created by yangpeng on 10/8/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>


@property(nonatomic, strong) UILabel *usernamelab;
@property(nonatomic, strong) UILabel *passwordlab;

@property(nonatomic, strong) IBOutlet UITextField *usernametf;
@property(nonatomic, strong) IBOutlet UITextField *passwordtf;
@property(nonatomic, strong) IBOutlet UIButton *regBtn;

@property(nonatomic, strong) IBOutlet UIScrollView *logsv;

-(IBAction)goNext:(id)sender;
-(IBAction)login:(id)sender;
-(IBAction)goRegisterView:(id)sender;

@end
