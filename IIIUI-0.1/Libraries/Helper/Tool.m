//
//  Tool.m
//  IIIUI-0.1
//
//  Created by yangpeng on 10/11/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "Tool.h"

@implementation Tool


+ (void)showHUD:(NSString *)text andView:(UIView *)view andHUD:(MBProgressHUD *)hud
{
    [view addSubview:hud];
    hud.labelText = text;
    hud.dimBackground = YES;
    hud.square = YES;
    [hud show:YES];
}


//目录处理
/**
 
 NSString *path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"badge"];
 
 [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
 
 NSString *result = [path stringByAppendingPathComponent:file];
 
 
 
 */

@end
