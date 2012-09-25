//
//  TmpImageViewController.m
//  IIIUI-0.1
//
//  Created by yangpeng on 9/25/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "TmpImageViewController.h"

@interface TmpImageViewController ()

@end

@implementation TmpImageViewController

@synthesize iv;

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
    //拿到应用程序沙盒里面的路径
    NSArray *paths = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    //读取存在沙盒里面的文件图片
    NSString *imgPath=[[paths objectAtIndex:0] stringByAppendingPathComponent:@"salesImageMid.jpg"];
    //因为拿到的是个路径 把它加载成一个data对象
    NSData *data=[NSData dataWithContentsOfFile:imgPath];
    //直接把该 图片读出来
    if (data != nil) {
        UIImage *img=[UIImage imageWithData:data];
        iv = [[UIImageView alloc]initWithImage:img];
    }
    
    // Do any additional setup after loading the view from its nib.
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
