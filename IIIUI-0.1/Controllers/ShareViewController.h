//
//  ShareViewController.h
//  IIIUI-0.1
//
//  Created by yangpeng on 10/11/12.
//  Copyright (c) 2012 You Star. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIVideoEditorControllerDelegate>

{
    int count;
    UIScrollView *myScrollView;
    NSMutableArray *tempPictures;
}
@property(nonatomic, strong) UIImagePickerController *ipc;

@property (strong, nonatomic) UIView* plcameraview;


@end
