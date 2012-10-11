//
//  Config.h
//  IIIUI-0.1
//
//  Created by yangpeng on 10/11/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Config : NSObject

//是否已经登录
@property BOOL isLogin;



//保存登录用户名以及密码
-(void)saveUserNameAndPwd:(NSString *)userName andPwd:(NSString *)pwd;
-(NSString *)getUserName;
-(NSString *)getPwd;
-(void)saveUID:(int)uid;
-(int)getUID;
-(void)saveCookie:(BOOL)_isLogin;
-(BOOL)isCookie;

+(Config *) Instance;

@end
