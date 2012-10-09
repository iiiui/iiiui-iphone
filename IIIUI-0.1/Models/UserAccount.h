//
//  UserAccount.h
//  IIIUI-0.1
//
//  Created by yangpeng on 10/8/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserAccount : NSObject

@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *password;

+(UserAccount *) username:(NSString *)username password:(NSString *)password;

@end


