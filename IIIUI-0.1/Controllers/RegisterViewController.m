//
//  RegisterViewController.m
//  IIIUI-0.1
//
//  Created by yangpeng on 10/9/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "RegisterViewController.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPClient.h"


//#import <QuartzCore/QuartzCore.h>

@interface RegisterViewController ()

@end

@implementation RegisterViewController


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

- (void)registerMeth
{
    NSDictionary *reginfo = [NSDictionary dictionaryWithObjectsAndKeys:@"msneeq@163.com",@"user[email]",@"123455", @"user[password]", nil];
    
    AFHTTPClient *client = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:@"http://192.168.1.115:3000"]];

    NSLog(@"aaa");

    
    [client postPath:@"/api/users/sign_up" parameters:reginfo success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"dd");
        NSString *text = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"Response: %@", text);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"errror");
            NSLog(@"%@",[error description]);
        }];
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
