//
//  AFTest.m
//  IIIUI-0.1
//
//  Created by yangpeng on 10/16/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "AFTest.h"
#import "AFJSONRequestOperation.h"
#import "UserShare.H"
//#import "JSONKit.h"

@implementation AFTest


@synthesize returnarr;

-(NSMutableArray *) getShareList
{
    NSString *urlStr = @"http://192.168.1.20:3000/api/user_shares/";
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSArray *arr = (NSArray *)JSON;        
        returnarr = [[NSMutableArray alloc]init];
        for (NSString * str in arr) {
            UserShare * userShare = [[UserShare alloc]init];
            userShare.img_url = [str valueForKey:@"picture_url"];
            userShare.sid = [[str valueForKey:@"id"] intValue];
            [returnarr addObject:userShare];
        }
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        
    }];

    NSLog(@"%d", [returnarr count]);

    [operation start];

  //  NSLog(@"returnarr_count: %d", [returnarr count]);

    return returnarr;
}

@end
