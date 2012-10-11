//
//  LoginViewController.m
//  IIIUI-0.1
//
//  Created by yangpeng on 10/8/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "IndexViewController.h"
#import "UserPageViewController.h"
#import "UserService.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize regBtn, usernamelab, passwordlab, usernametf,passwordtf,logsv, tabbar, ipc,userAccount;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initControl];
    [self initUI];
}


//初始化界面 ，设置基本属性
- (void)initUI
{
   
    //键盘通知
//  [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(getFocus) name:UIControlEventTouchDown object:nil];
    
    usernametf.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordtf.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordtf.secureTextEntry = YES;
    
    usernametf.delegate = self;
    passwordtf.delegate = self;
    
    logsv.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height+100);
}


//背景点击事件
-(void)initControl
{
    UIControl *background = [[UIControl alloc]initWithFrame:self.view.frame];
    [background addTarget:self action:@selector(dobackground) forControlEvents:UIControlEventTouchUpInside];
    [self.logsv insertSubview:background atIndex:0];
}

//背景点击 键盘消失
-(void)dobackground
{
    [usernametf resignFirstResponder];
    [passwordtf resignFirstResponder];
}

//跳转注册
-(IBAction)goRegisterView:(id)sender
{
    RegisterViewController *regView = [[RegisterViewController alloc]initWithNibName:@"RegisterViewController" bundle:nil];
    UINavigationController *regNav = [[UINavigationController alloc]initWithRootViewController:regView];
    regView.navigationItem.title = @"注册";
    regView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:regNav animated:YES];
}



//键盘NEXT
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag == 2) {
        [self performSelector:@selector(login) withObject:self];
    } else {
        [passwordtf becomeFirstResponder];        
    }
    return YES;
}


//登陆
-(void)login
{
    
    NSString *username = usernametf.text;
    NSString *password = passwordtf.text;

    //做验证
    userAccount = [UserAccount username:username password:password];
    [self loginRemote:userAccount];
}

//登陆成功 初始界面
-(void)login_success_initui
{
    tabbar = [[UITabBarController alloc]init];
    
    IndexViewController *indexPage= [[IndexViewController alloc]initWithNibName:@"IndexViewController" bundle:nil];
    indexPage.tabBarItem.title = @"首页";
    indexPage.tabBarItem.tag = 1;
    
    UserPageViewController *userPage = [[UserPageViewController alloc]initWithNibName:@"UserPageViewController" bundle:nil];
    userPage.navigationItem.title = @"用户主页";
    
    UINavigationController *usernav = [[UINavigationController alloc]initWithRootViewController:userPage];
    usernav.tabBarItem.title = @"用户主页";
    
    //调用摄像头
    ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType =  UIImagePickerControllerSourceTypeCamera;
    ipc.showsCameraControls = NO;
    ipc.allowsEditing = NO;
    ipc.delegate = self;
    ipc.tabBarItem.title = @"分享";
    
    NSArray *views = [[NSArray alloc]initWithObjects:indexPage, ipc, usernav, nil];
    tabbar.viewControllers = views;
    
    tabbar.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:tabbar animated:YES];
}


//远程登陆验证
-(void)loginRemote:(UserAccount *)sub_userAccount
{
    BOOL loginflag = [UserService loginRemote:sub_userAccount];
    if (loginflag == YES) {
        [self login_success_initui];
    }    
}


//键盘通知
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
