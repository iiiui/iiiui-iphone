//
//  UserShare.h
//  IIIUI-0.1
//
//  Created by yangpeng on 10/16/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserShare : NSObject
{
    int sid;
    NSString * img_url;
    
}

@property(nonatomic, assign) int sid;
@property(nonatomic, strong) NSString *img_url;

@end
