//
//  UserService.h
//  IIIUI-0.1
//
//  Created by yangpeng on 10/11/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserService.h"
#import "UserAccount.h"

@interface UserService : NSObject

+(BOOL) loginRemote : (UserAccount *)userAccount;

+(BOOL) registerRemote : (UserAccount *)userAccount;

@end
