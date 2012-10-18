//
//  UserAccount.h
//  IIIUI-0.1
//
//  Created by yangpeng on 10/8/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserAccount : NSObject

@property (nonatomic, assign) int *uid;
@property (nonatomic, assign) NSString *name;
@property (nonatomic, assign) NSString *email;

@property (nonatomic, assign) NSString *username;
@property (nonatomic, assign) NSString *password;


+(UserAccount *) username:(NSString *)username password:(NSString *)password;


+(UserAccount *) uid:(int)uid name:(NSString *)name email:(NSString *)email;


@end


