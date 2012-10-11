//
//  PicEditViewController.m
//  IIIUI-0.1
//
//  Created by yangpeng on 10/11/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "PicEditViewController.h"

@interface PicEditViewController ()

@end

@implementation PicEditViewController

@synthesize picArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"图片编辑";
        //隐藏底部
        self.hidesBottomBarWhenPushed=YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}

-(void)initUI
{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backItem)];
    
    UIBarButtonItem *nextStep = [[UIBarButtonItem alloc]initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(nextStep)];
    
    self.navigationItem.leftBarButtonItem = backItem;
    self.navigationItem.rightBarButtonItem = nextStep;
    
}

-(void)nextStep
{
    [IIIUIAlertView popAlert:@"提示" content:@"下一步"];
}

-(void)backItem
{
    [IIIUIAlertView popAlert:@"提示" content:@"返回"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
