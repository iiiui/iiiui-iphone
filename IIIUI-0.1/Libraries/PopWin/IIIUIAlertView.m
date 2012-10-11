//
//  IIIUIAlertView.m
//  IIIUI-0.1
//
//  Created by yangpeng on 10/11/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "IIIUIAlertView.h"

@implementation IIIUIAlertView


+(void)popAlert:(NSString *)title content:(NSString *)content
{
    UIAlertView *uv = [[UIAlertView alloc]initWithTitle:title message:content delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil];
    [uv show];
}

@end
