//
//  IIIUIAFHTTPClient.m
//  IIIUI-0.1
//
//  Created by yangpeng on 10/11/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "IIIUIAFHTTPClient.h"

@implementation IIIUIAFHTTPClient

+(AFHTTPClient *) getAFClient
{
    AFHTTPClient * client = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:api_domain]];
    return client;
}

@end
