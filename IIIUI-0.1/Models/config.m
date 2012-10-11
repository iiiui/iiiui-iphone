//
//  Config.m
//  IIIUI-0.1
//
//  Created by yangpeng on 10/11/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "Config.h"

@implementation Config

@dynamic isLogin;


-(void)saveUserNameAndPwd:(NSString *)userName andPwd:(NSString *)pwd
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    [settings removeObjectForKey:@"username"];
    [settings removeObjectForKey:@"password"];
    [settings setObject:userName forKey:@"username"];
    [settings setObject:pwd forKey:@"password"];
    [settings synchronize];
}



-(NSString *)getUserName
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    return [settings objectForKey:@"username"];
}

-(NSString *)getPwd
{
    NSUserDefaults * settings = [NSUserDefaults standardUserDefaults];
    return [settings objectForKey:@"password"];
}

-(void)saveUID:(int)uid
{
    NSUserDefaults *setting = [NSUserDefaults standardUserDefaults];
    [setting removeObjectForKey:@"uid"];
    [setting setObject:[NSString stringWithFormat:@"%d", uid] forKey:@"uid"];
    [setting synchronize];
}

-(int)getUID
{
    NSUserDefaults * setting = [NSUserDefaults standardUserDefaults];
    NSString *value = [setting objectForKey:@"uid"];
    if (value && [value isEqualToString:@""] == NO)
    {
        return [value intValue];
    }
    else
    {
        return 0;
    }
}

-(void)saveCookie:(BOOL)_isLogin
{
    NSUserDefaults * setting = [NSUserDefaults standardUserDefaults];
    [setting removeObjectForKey:@"cookie"];
    [setting setObject:self.isLogin ? @"1" : @"0" forKey:@"cookie"];
    [setting synchronize];
}

-(BOOL)isCookie
{
    NSUserDefaults * setting = [NSUserDefaults standardUserDefaults];
    NSString * value = [setting objectForKey:@"cookie"];
    if (value && [value isEqualToString:@"1"]) {
        return YES;
    }
    else
    {
        return NO;
    }
}

static Config * instance = nil;
+(Config *) Instance
{
    @synchronized(self)
    {
        if(nil == instance)
        {
            [self new];
        }
    }
    return instance;
}


@end
