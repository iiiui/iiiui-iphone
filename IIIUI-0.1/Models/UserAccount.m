//
//  UserAccount.m
//  IIIUI-0.1
//
//  Created by yangpeng on 10/8/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "UserAccount.h"

@implementation UserAccount

@synthesize username;
@synthesize password;


+(UserAccount *) username:(NSString *)username password:(NSString *)password
{
    UserAccount *userAccount = [[UserAccount alloc]init];
    userAccount.username = username;
    userAccount.password = password;
    return userAccount;
}
@end


