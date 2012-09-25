//
//  LoginViewController.h
//  IIIUI-0.1
//
//  Created by yangpeng on 9/24/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>


@property (nonatomic, retain) IBOutlet UITextField *usernameTf;
@property (nonatomic, retain) IBOutlet UITextField *passwordTf;

@property (nonatomic, retain) IBOutlet UIButton *shareBtn;
@property (nonatomic, retain) IBOutlet UIButton *regBtn;
@property (nonatomic, retain) IBOutlet UIButton *logBtn;


@property (nonatomic, strong) IBOutlet UITabBarController *tabbar;

-(IBAction)shareMeth:(id)sender;
-(IBAction)regMeth:(id)sender;
-(IBAction)logMeth:(id)sender;


@end
