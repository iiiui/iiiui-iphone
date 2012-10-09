//
//  LoginViewController.m
//  IIIUI-0.1
//
//  Created by yangpeng on 10/8/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize regBtn, usernamelab, passwordlab, usernametf,passwordtf,logsv;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI
{
    
//   [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardWillShow) name:UIKeyboardWillShowNotification object:nil];
    
//    usernametf.clearButtonMode = UITextFieldViewModeWhileEditing;
//    passwordtf.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UIView *uv = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    usernametf.inputAccessoryView = uv;

    usernametf.delegate = self;
    passwordtf.delegate = self;
    
    //  [usernametf becomeFirstResponder];
    logsv.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height+100);
}

-(IBAction)goRegisterView:(id)sender
{
    RegisterViewController *regView = [[RegisterViewController alloc]initWithNibName:@"RegisterViewController" bundle:nil];
    UINavigationController *regNav = [[UINavigationController alloc]initWithRootViewController:regView];
    regView.navigationItem.title = @"注册";
    regView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;

    [self presentModalViewController:regNav animated:YES];
}

//-(void)keyBoardWillShow:(NSNotification *)note
//{
//    UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];//知识点
//    for(int i=0; i<[tempWindow.subviews count]; i++)
//    {
//
//        NSObject *keyboard = [tempWindow.subviews objectAtIndex:i];
//        if([[keyboard description] hasPrefix:@"<UIKeyboard"] == YES)
//        {
//           //keyboard.description;
//           //[keyboard addSubview:keyPadView1];
//            
//        }
//    }
//}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag == 2) {
        UIAlertView *av = [[UIAlertView alloc]initWithTitle:@"提示" message:@"测试" delegate:nil cancelButtonTitle:@"close" otherButtonTitles: nil];
        [av show];
        
    } else {
        [passwordtf becomeFirstResponder];        
    }
    return YES;
}


-(IBAction)goNext:(id)sender
{
}

-(IBAction)login:(id)sender
{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
