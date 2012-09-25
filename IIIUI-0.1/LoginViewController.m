//
//  LoginViewController.m
//  IIIUI-0.1
//
//  Created by yangpeng on 9/24/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "HomeViewController.h"
#import "ShareViewController.h"
#import "UserCenterViewController.h"
#import "OtherViewController.h"
#import "CameraViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize usernameTf;
@synthesize passwordTf;
@synthesize tabbar;
@synthesize logBtn;

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
}

-(IBAction)regMeth:(id)sender
{
    RegisterViewController *registerViewController = [[RegisterViewController alloc]initWithNibName:@"RegisterViewController" bundle:nil];
    
    UINavigationController * regnav=[[UINavigationController alloc] initWithRootViewController:registerViewController];
    
    regnav.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;

    [self presentModalViewController:regnav animated:YES];

}

-(IBAction)logMeth:(id)sender
{
    
    
    HomeViewController *homeViewController = [[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    homeViewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"首页" image:nil tag:0];
    
    ShareViewController *shareViewController = [[ShareViewController alloc]initWithNibName:@"ShareViewController" bundle:nil];
    shareViewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"分享" image:nil tag:1];
    
    
    UserCenterViewController *userCenterViewController = [[UserCenterViewController alloc]initWithNibName:@"UserCenterViewController" bundle:nil];
    userCenterViewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:nil tag:3];
    
    OtherViewController *otherViewController = [[OtherViewController alloc]initWithNibName:@"OtherViewController" bundle:nil];
    otherViewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"其他" image:nil tag:4];

    CameraViewController *cameraViewController = [[CameraViewController alloc]initWithNibName:@"CameraViewController" bundle:nil];
    cameraViewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"随拍" image:nil tag:2];
    
    NSArray *controllers = [NSArray arrayWithObjects:homeViewController,shareViewController,cameraViewController, userCenterViewController,otherViewController, nil];
    tabbar = [[UITabBarController alloc]init];
    tabbar.viewControllers = controllers;
    
    tabbar.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:tabbar animated:YES];
   
}

-(IBAction)shareMeth:(id)sender
{
    UIImagePickerController *pick = [[UIImagePickerController alloc]init];
    pick.delegate = self;
    pick.sourceType = UIImagePickerControllerSourceTypeCamera;    
    [self presentModalViewController:pick animated:YES];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
