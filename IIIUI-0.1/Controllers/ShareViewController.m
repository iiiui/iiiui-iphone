//
//  ShareViewController.m
//  IIIUI-0.1
//
//  Created by yangpeng on 10/11/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import "ShareViewController.h"
#import "PicEditViewController.h"

@interface ShareViewController ()
{

}
@end

@implementation ShareViewController
@synthesize ipc,plcameraview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    //    self.view.hidden = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initPic];

}

-(void) initPic
{
    count = -1;
    tempPictures = [[NSMutableArray alloc] init];
    
    //调用摄像头
    ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType =  UIImagePickerControllerSourceTypeCamera;
    ipc.showsCameraControls = NO;
    ipc.allowsEditing = NO;
    ipc.delegate = self;
    
    [self presentModalViewController:ipc animated:YES];
    [self performSelector:@selector(setupUI:) withObject:ipc.view afterDelay:0.5f];

}

- (void) setupUI : (UIView *) aView
{
    //获取相机界面的view
    self.plcameraview = [self findView:aView withName:@"PLCameraView"];
    if (!plcameraview) return;

    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1 setFrame:CGRectMake(10, 450, 40, 25)];
    [btn1 setTitle:@"相册" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(imageLibary:) forControlEvents:UIControlEventTouchUpInside];
    [self.plcameraview addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setFrame:CGRectMake(130, 450, 40, 25)];
    [btn2 setTitle:@"拍照" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(takePic:) forControlEvents:UIControlEventTouchUpInside];
    [self.plcameraview addSubview:btn2];

    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn3 setFrame:CGRectMake(250, 450, 40, 25)];
    [btn3 setTitle:@"完成" forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(Done:) forControlEvents:UIControlEventTouchUpInside];
    [self.plcameraview addSubview:btn3];
    
    myScrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(0, 378, 320, 50)];
    myScrollView.tag = 4444;
    myScrollView.backgroundColor = [UIColor yellowColor];
    //设置隐藏
    [self.plcameraview addSubview: myScrollView];
    [myScrollView setHidden:YES];

}


-(UIView *)findView:(UIView *)aView withName:(NSString *)name{
    
    Class cl = [aView class];
    NSString *desc = [cl description];
    
    if ([name isEqualToString:desc])
        return aView;
    
    for (NSUInteger i = 0; i < [aView.subviews count]; i++)
    {
        UIView *subView = [aView.subviews objectAtIndex:i];
        subView = [self findView:subView withName:name];
        if (subView)
            return subView;
    }
    return nil;
}


-(void)takePic:sender{
    
    [ipc takePicture];
    count +=1;
}

-(void)imageLibary:sender{
    
    [self imagePickerControllerDidCancel:ipc];    
    [self performSelector:@selector(showImageLib) withObject:ipc.view afterDelay:0.5f];
}

-(void)showImageLib{
    UIImagePickerController *imagePickerController=[[UIImagePickerController alloc] init];
    imagePickerController.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    imagePickerController.allowsEditing = YES;
    imagePickerController.delegate = self;
    [self presentModalViewController:imagePickerController animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
    
    UIImageView *myImageView = [[UIImageView alloc] initWithImage: image];
    myImageView.frame = CGRectMake(count*46,2,46,46);
    
    [tempPictures addObject:image];
    myScrollView.contentSize = CGSizeMake( count*46, 46);
    [myScrollView addSubview:myImageView];
    [myScrollView setHidden:NO];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
	[picker dismissModalViewControllerAnimated:YES];
}



-(IBAction)Done:(id)sender{
    
    [self imagePickerControllerDidCancel:ipc];
    
    PicEditViewController *picEditView = [[PicEditViewController alloc] initWithNibName:@"PicEditViewController" bundle:nil];
    picEditView.picArray = tempPictures;
    
    [self.navigationController pushViewController:picEditView animated:YES];
    
    count = -1;
    
    //要删除，不然内存溢出!
    //    [tempPictures removeAllObjects];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
