//
//  CameraViewController.m
//  IIIUI-0.1
//
//  Created by yangpeng on 9/25/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "CameraViewController.h"
#import "HomeViewController.h"
#import "TmpImageViewController.h"


@interface CameraViewController ()

@end

@implementation CameraViewController

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
    UIImagePickerController *pick = [[UIImagePickerController alloc]init];
    pick.delegate = self;
  //  pick.editing = YES;
    pick.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentModalViewController:pick animated:YES];
    // Do any additional setup after loading the view from its nib.
}

- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker
{
    
    [[picker parentViewController] dismissModalViewControllerAnimated: YES];
    
}

- (void) imagePickerController: (UIImagePickerController *) picker didFinishPickingMediaWithInfo: (NSDictionary *) info
{
     
    UIImage *image= [info objectForKey: @"UIImagePickerControllerOriginalImage"];
    if(picker.sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        // UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    
    UIImage *small = [CameraViewController imageWithImageSimple:image scaledToSize:CGSizeMake( 120.0, 120.0 )];
    UIImage *midImage = [CameraViewController imageWithImageSimple:image scaledToSize:CGSizeMake( 210.0, 210.0 )];
    UIImage *bigImage = [CameraViewController imageWithImageSimple:image scaledToSize:CGSizeMake( 440.0, 440.0 )];
    
    [self saveImage:small WithName: @"salesImageSmall.jpg" ];
    [self saveImage:midImage WithName: @"salesImageMid.jpg" ];
    [self saveImage:bigImage WithName: @"salesImageBig.jpg" ];
    
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark 从文档目录下获取Documents路径
- (NSString * )documentFolderPath
{
    return [NSHomeDirectory() stringByAppendingPathComponent: @" Documents " ];
}

- (void)saveImage:(UIImage *)tempImage WithName:(NSString * )imageName
{
    NSData* imageData = UIImagePNGRepresentation(tempImage);
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDirectory = [paths objectAtIndex: 0 ];
    // Now we get the full path to the file
    NSString* fullPathToFile = [documentsDirectory stringByAppendingPathComponent:imageName];
    // and then we write it out
    [imageData writeToFile:fullPathToFile atomically:NO];
}

// 压缩图片
+ (UIImage*)imageWithImageSimple:(UIImage* )image scaledToSize:(CGSize)newSize
{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake( 0, 0 ,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image. 
    return newImage;
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
