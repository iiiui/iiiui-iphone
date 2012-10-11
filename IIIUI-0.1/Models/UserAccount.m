//
//  UserAccount.m
//  IIIUI-0.1
//
//  Created by yangpeng on 10/8/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "UserAccount.h"

@implementation UserAccount

@synthesize uid,name,username,password;


+(UserAccount *) username:(NSString *)username password:(NSString *)password
{
    UserAccount *userAccount = [[UserAccount alloc]init];
    userAccount.username = username;
    userAccount.password = password;
    return userAccount;
}

+(UserAccount *) uid:(int)uid name:(NSString *)name email:(NSString *)email
{
    UserAccount *userAccount = [[UserAccount alloc]init];
    userAccount.uid = &uid;
    userAccount.name = name;
    userAccount.email = email;
    return userAccount;
}



@end


