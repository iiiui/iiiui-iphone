//
//  LoginViewController.m
//  iiiui-0.2
//
//  Created by yangpeng on 9/18/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ShareViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize registerBtn;
@synthesize username;
@synthesize password;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)loginMeth:(id)sender {
    NSLog(@"%@", username.text);
    NSLog(@"%@", password.text);

//    [self.navigationController pushViewController:pick animated:YES];

}

-(IBAction)shareMeth:(id)sender {

//    ShareViewController *shareViewController = [[ShareViewController alloc]initWithNibName:@"HomePageViewController" bundle:nil];
//    [self presentModalViewController:shareViewController animated:YES];
    
    UIImagePickerController *pick = [[UIImagePickerController alloc] init];
    pick.delegate = self;
    pick.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentModalViewController:pick animated:YES];
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//    if (isCamera) {
        [picker dismissModalViewControllerAnimated:NO];
        
        // 把拍摄的照片保存到本地        
        UIImage *photo = [info objectForKey:UIImagePickerControllerOriginalImage];
        if (photo) {
            UIImageWriteToSavedPhotosAlbum(photo, self,
                                           @selector(image:didFinishSavingWithError:contextInfo:), nil);
        }
    }


-(IBAction)registerMeth:(id)sender {
    RegisterViewController *registerViewController = [[RegisterViewController alloc]initWithNibName:@"RegisterViewController" bundle:nil];
    [self presentModalViewController:registerViewController animated:YES];    
}

-(IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
