//
//  ViewController.m
//  TestImgPick
//
//  Created by Andrew on 14/12/9.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UIActionSheetDelegate>
@property (nonatomic,strong)UIImageView *imgView;
@property (nonatomic,strong)UIImagePickerController *imgPickViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    // Do any additional setup after loading the view, typically from a nib.
    _imgView=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    _imgView.backgroundColor=[UIColor blueColor];
    [self.view addSubview:_imgView];
    
    

    UIButton *btn=[[UIButton alloc]initWithFrame:_imgView.frame];
    [btn setTitle:@"更改图片" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(changeAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)changeAction:(UIButton *)btn{
    UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机中选择", nil];
    [actionSheet showInView:self.view];
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    UIImagePickerControllerSourceType type;
    switch (buttonIndex) {
        case 1:
            type=UIImagePickerControllerSourceTypeCamera;
            break;
        case 2:
            type=UIImagePickerControllerSourceTypePhotoLibrary;
            break;
        default:
            break;
    }
    [self startImageViewSelectCameralAndPhoto:type];
}
#pragma mark
#pragma mark--启动相机的方法
-(void)startImageViewSelectCameralAndPhoto:(UIImagePickerControllerSourceType)type{
    if(![UIImagePickerController isSourceTypeAvailable:type]){
        NSString *message;
        switch (type) {
            case UIImagePickerControllerSourceTypeCamera:
                message=@"相机无法启动";
                break;
            case UIImagePickerControllerSourceTypePhotoLibrary:
                message=@"相册无法打开";
                break;
            default:
                break;
        }
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    UIImagePickerController *uiipc = [[UIImagePickerController alloc] init];
    uiipc.delegate=self;
    uiipc.mediaTypes=[UIImagePickerController availableMediaTypesForSourceType:uiipc.sourceType];
    //    uiipc.mediaTypes = @[(NSString *)kUTTypeImage];
    //    uiipc.mediaTypes=@[(NSString *)kUTTypeRawImage];
    uiipc.sourceType = type;
    uiipc.allowsEditing = YES;
    _imgPickViewController=uiipc;
    [self presentViewController:_imgPickViewController animated:NO completion:nil];
}

#pragma mark
#pragma mark--UIImagePickControllerDelegate
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    if(picker==_imgPickViewController){
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[UIImagePickerControllerEditedImage];
    if (!image) image = info[UIImagePickerControllerOriginalImage];
    self.imgView.image=image;
    //    NSData *data =UIImagePNGRepresentation(image);
    //    [[NSUserDefaults standardUserDefaults] setObject:data forKey:GET_TOKEN];
    //    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewControllerAnimated:NO completion:NULL];
}



@end
