//
//  SystemSettingViewController.m
//  Controller
//
//  Created by lws on 14-8-25.
//  Copyright (c) 2014年 lws. All rights reserved.
//

#import "SystemSettingViewController.h"
#import "NetWorkDelegate.h"

@interface SystemSettingViewController ()
@property (weak, nonatomic) IBOutlet UITextField *m_hostIpAddress;
@property (strong, nonatomic) IBOutlet UIButton *codeBtn;
@property (strong, nonatomic) IBOutlet UIButton *quitBtn;

@end

@implementation SystemSettingViewController

- (IBAction)triggSignal:(UIButton *)sender {
        NSString *message = [[NSString alloc] initWithFormat:@"%ld", (long)sender.tag];
        NSData *data = [message dataUsingEncoding:NSUTF8StringEncoding];
        [[NetWorkDelegate sharedInstance] sendRawData:data callBack:nil];
    
}

-(BOOL)checkIpAddress:(NSString*) ip
{
        NSArray *ipSegs = [ip componentsSeparatedByString:@"."];
        
        if ([ipSegs count] != 4)
                return false;
        
        __block bool result = true;
        
        [ipSegs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                NSString* ipStr = (NSString*)obj;
                int ipValue = [ipStr intValue];
                if (ipValue < 0 || ipValue > 254)
                        result = false;
        }];
        
        return result;
}

- (IBAction)changeOk:(UITextField *)sender {
        [sender resignFirstResponder];
        
        NSString* ip = sender.text;
        
        if ([self checkIpAddress:ip])
        {
                NSString* filePath = [NetWorkDelegate dataFilePath:IP_CACHED_FILE_NAME];
                NSError* err;
                BOOL re = [ip writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&err];
                NSLog(@"---store file with res=%d", re);
                if (err != nil)
                {
                        NSLog(@"---store file with error=%@", err);
                }
                g_hostIpAddress = ip;
                //store it to cache;
               [[NetWorkDelegate sharedInstance] changeHost:ip];
        }
}

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

    self.m_hostIpAddress.text = g_hostIpAddress;
    
    //添加按钮事件
    [_codeBtn addTarget:self action:@selector(codeClick:) forControlEvents:UIControlEventTouchUpInside];
    [_quitBtn addTarget:self action:@selector(quitClick:) forControlEvents:UIControlEventTouchUpInside];
   
}




#pragma mark
#pragma mark--按钮点击
-(void)codeClick:(UIButton*)btn{
    
    PAGETYPE pType=[AppDelegate globalDelegate].pType;
    if(pType==PTYPE_TV){
        NSLog(@"TV");
        [AppDelegate globalDelegate].isLearningModel=YES;
        self.codeBtn.enabled=NO;
        [self.tabBarController setSelectedIndex:0];
    }else if(pType==PTYPE_DVD){
        [AppDelegate globalDelegate].isDVDModel=YES;
        self.codeBtn.enabled=NO;
        [self.tabBarController setSelectedIndex:2];

    }
  
}
-(void)quitClick:(UIButton *)btn{
    PAGETYPE pType=[AppDelegate globalDelegate].pType;
    if(pType==PTYPE_TV){
        NSLog(@"TV");
        [AppDelegate globalDelegate].isLearningModel=NO;
        self.codeBtn.enabled=YES;
        [self.tabBarController setSelectedIndex:0];

    }else if(pType==PTYPE_DVD){
        [AppDelegate globalDelegate].isDVDModel=NO;
        self.codeBtn.enabled=YES;
        [self.tabBarController setSelectedIndex:2];

    }

}
@end
