//
//  UserPageViewController.m
//  IIIUI-0.1
//
//  Created by yangpeng on 10/9/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "UserPageViewController.h"
#import "LoginViewController.h"
#import "SettingViewController.h"

@interface UserPageViewController ()

@end

@implementation UserPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        UIBarButtonItem *logout = [[UIBarButtonItem alloc]initWithTitle:@"注销" style:UIBarButtonItemStyleBordered target:self action:@selector(logout)];

        UIBarButtonItem *setting = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStyleBordered target:self action:@selector(setting)];
        
        self.navigationItem.rightBarButtonItem = logout;

        self.navigationItem.leftBarButtonItem = setting;
        

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)setting
{
    SettingViewController *settingView = [[SettingViewController alloc]initWithNibName:@"SettingViewController" bundle:nil];
    
    settingView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self.navigationController pushViewController:settingView animated:YES];
}

-(void)logout
{
    [[Config Instance]saveUID:nil];
    [[Config Instance]saveCookie:NO];
    LoginViewController *loginview = [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    loginview.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:loginview animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
