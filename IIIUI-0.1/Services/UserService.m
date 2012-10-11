//
//  UserService.m
//  IIIUI-0.1
//
//  Created by yangpeng on 10/11/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "UserService.h"

@implementation UserService
BOOL loginflag;

+(BOOL) loginRemote : (UserAccount *)userAccount
{
    NSString *alerttip = @"登陆提示";
    NSDictionary *reginfo = [NSDictionary dictionaryWithObjectsAndKeys:userAccount.username, @"user[email]", userAccount.password, @"user[password]", nil];
    
    AFHTTPClient *client = [IIIUIAFHTTPClient getAFClient];
    [client postPath:api_users_sign_in parameters:reginfo success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *result = [responseObject objectFromJSONData];
 //     NSLog(@"%@",[result description]);
        NSString *loginStatus = [result objectForKey:@"success"];
        loginflag = [loginStatus boolValue];
        if(loginflag == YES) {
        // NSDictionary *userinfo = [result objectForKey:@"user"];

        } else {
            [IIIUIAlertView popAlert:alerttip content:[result objectForKey:@"errors"]];
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [IIIUIAlertView popAlert:alerttip content:[error description]];
    }];
    return loginflag;
}

@end
