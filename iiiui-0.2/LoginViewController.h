//
//  LoginViewController.h
//  iiiui-0.2
//
//  Created by yangpeng on 9/18/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UIImagePickerControllerDelegate>

@property (nonatomic, retain) IBOutlet UIButton *registerBtn;

@property (nonatomic, retain) IBOutlet UITextField *username;
@property (nonatomic, retain) IBOutlet UITextField *password;


-(IBAction)loginMeth:(id)sender;
-(IBAction)registerMeth:(id)sender;

-(IBAction)shareMeth:(id)sender;


-(IBAction)textFieldDoneEditing:(id)sender;

@end

