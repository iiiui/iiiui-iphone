//
//  SettingViewController.m
//  IIIUI-0.1
//
//  Created by yangpeng on 10/11/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController
@synthesize userinfo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"个人中心";
        UIBarButtonItem *returnitem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(returnuserpage)];
        
        UIBarButtonItem *saveitem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleBordered target:self action:@selector(saveuserinfo)];
        
        self.navigationItem.leftBarButtonItem = returnitem;
        self.navigationItem.rightBarButtonItem = saveitem;        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"%d", [[Config Instance]getUID]);
    userinfo.text = [[NSString alloc]initWithFormat:@"%d",[[Config Instance]getUID]];
    
}

-(void)saveuserinfo
{
    [IIIUIAlertView popAlert:@"保持提示" content:@"保存个人数据"];
}

-(void)returnuserpage
{
    self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self.navigationController popToRootViewControllerAnimated:YES];
    //    [[self presentingViewController] dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
