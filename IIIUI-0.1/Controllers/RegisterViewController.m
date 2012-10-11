//
//  RegisterViewController.m
//  IIIUI-0.1
//
//  Created by yangpeng on 10/9/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "RegisterViewController.h"
#import "UserPageViewController.h"
#import "IndexViewController.h"
#import "UserService.h"

//#import <QuartzCore/QuartzCore.h>

@interface RegisterViewController ()

@end

@implementation RegisterViewController

@synthesize usernametf,passwordtf,ipc,userAccount,hud, tabbar;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self initUI];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void) initUI
{
    UIBarButtonItem *returnLogBtn = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStyleBordered target:self action:@selector(returnLogMeth)];
    UIBarButtonItem *regConfBtn = [[UIBarButtonItem alloc]initWithTitle:@"确认" style:UIBarButtonItemStyleBordered target:self action:@selector(registerMeth)];
    
    self.navigationItem.leftBarButtonItem = returnLogBtn;
    self.navigationItem.rightBarButtonItem = regConfBtn;
    
}

//用户注册
- (void)registerMeth
{
    NSString *username = usernametf.text;
    NSString *password = passwordtf.text;
    
    //做验证
    userAccount = [UserAccount username:username password:password];
    
    hud = [[MBProgressHUD alloc] initWithView:self.view];
    [Tool showHUD:@"正在注册" andView:self.view andHUD:hud];
    
    BOOL flag = [UserService registerRemote:userAccount];
    if (flag == YES) {
        [hud hide:YES];
        [self register_success_initui];
    } else {
        [hud hide:YES];
    }

}

-(void) register_success_initui
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

- (void)returnLogMeth
{
    [[self presentingViewController]dismissModalViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
