//
//  UserService.m
//  IIIUI-0.1
//
//  Created by yangpeng on 10/11/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "UserService.h"

@implementation UserService
BOOL returnflag;

+(BOOL) loginRemote : (UserAccount *)userAccount
{
    NSString *alerttip = @"登陆提示";
    NSDictionary *reginfo = [NSDictionary dictionaryWithObjectsAndKeys:userAccount.username, @"user[email]", userAccount.password, @"user[password]", nil];
    
    AFHTTPClient *client = [IIIUIAFHTTPClient getAFClient];
    [client postPath:api_users_sign_in parameters:reginfo success:^(AFHTTPRequestOperation *operation, id responseObject) {
 
        NSDictionary *result = [responseObject objectFromJSONData];
 //     NSLog(@"%@",[result description]);
        NSString *loginStatus = [result objectForKey:@"success"];
        returnflag = [loginStatus boolValue];

        if(returnflag == YES) {
            NSDictionary *userinfo = [result objectForKey:@"user"];
            int uid = [[userinfo objectForKey:@"id"] intValue];
            [[Config Instance]saveUID:uid];
            [[Config Instance]saveCookie:YES];
            
        } else {
            [IIIUIAlertView popAlert:alerttip content:[result objectForKey:@"errors"]];
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [IIIUIAlertView popAlert:alerttip content:[error description]];
    }];
    return returnflag;
}

+(BOOL) registerRemote : (UserAccount *)userAccount
{
    NSString *alerttip = @"注册提示";
    NSDictionary *reginfo = [NSDictionary dictionaryWithObjectsAndKeys:userAccount.username, @"user[email]", userAccount.password, @"user[password]", nil];
    
    AFHTTPClient *client = [IIIUIAFHTTPClient getAFClient];
    [client postPath:api_users_sign_up parameters:reginfo success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *result = [responseObject objectFromJSONData];
        
//        NSLog(@"%@",[result description]);
        
        NSString *loginStatus = [result objectForKey:@"success"];
        returnflag = [loginStatus boolValue];

        if(returnflag == YES) {
            NSDictionary *userinfo = [result objectForKey:@"user"];
            int uid = [[userinfo objectForKey:@"id"] intValue];
            [[Config Instance]saveUID:uid];
            [[Config Instance]saveCookie:YES];
            
        } else {
           // NSDictionary *errors = [result objectForKey:@"errors"];
            [IIIUIAlertView popAlert:alerttip content:@"注册错误"];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [IIIUIAlertView popAlert:alerttip content:[error description]];
    }];
    return returnflag;
}

@end
