//
//  Tool.h
//  IIIUI-0.1
//
//  Created by yangpeng on 10/11/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tool : NSObject

//是否具备网络链接
@property BOOL isNetworkRunning;

-(NSString *)getIOSGuid;


@end
