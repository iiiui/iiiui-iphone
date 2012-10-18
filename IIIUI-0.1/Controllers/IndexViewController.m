//
//  IndexViewController.m
//  IIIUI-0.1
//
//  Created by yangpeng on 10/9/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "IndexViewController.h"
#import "AFTest.h"
#import "UserShare.h"

@interface IndexViewController ()
{
    NSMutableArray *arr;
}
@end

@implementation IndexViewController

@synthesize sharelist;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        AFTest *test = [[AFTest alloc] init];
        arr = [test getShareList];
        NSLog(@"%@", arr);

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * showUserInfoCellIdentifier = @"ShowUserInfoCell";
    UITableViewCell * cell = [sharelist dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:showUserInfoCellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.showsReorderControl = YES;
    }
    
    // Configure the cell.
    UserShare *userShare = [arr objectAtIndex:indexPath.row];
    cell.textLabel.text = [ NSString stringWithFormat:@"%d", userShare.sid ];
    cell.textLabel.text = @"测试";
    
//    
//    UIImageView *iv = [[UIImageView alloc]init];
//    iv setImage:UIImage
//    cell.imageView =
//    
//    cell.detailTextLabel.text = [NSString stringWithCString:userInfo.user_signature.c_str()  encoding:NSUTF8StringEncoding];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    [arr count];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
