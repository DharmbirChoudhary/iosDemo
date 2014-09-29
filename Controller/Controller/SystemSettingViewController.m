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

@property (nonatomic,strong)UITextView *textView;
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



- (void)viewDidLoad
{
    [super viewDidLoad];

    self.m_hostIpAddress.text = g_hostIpAddress;
    
    //添加按钮事件
    [_codeBtn addTarget:self action:@selector(codeClick:) forControlEvents:UIControlEventTouchUpInside];
    [_quitBtn addTarget:self action:@selector(quitClick:) forControlEvents:UIControlEventTouchUpInside];
 
    //添加显示内容的textview
    if(!_textView){
        _textView = [[UITextView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_quitBtn.frame)+10, SCREEN_WIDTH-40, SCREEN_HEIGHT-10-200)];
        [self.view addSubview:_textView];
        _textView.backgroundColor=[UIColor whiteColor];
        [_textView setEditable:NO];
        
        _textView.text=@" In order to use TV and DVD control, 'CODE LEARNING' has to be done first. Select TV or DVD control tab, then press 'CODE LEARNING' from Menu. Once selected,'LEARNING MODE'  text is flashing on the phone screen and LED light on the 'Controller' is blinking too. Press a button of App you wish to learn, say 'on/off' button,LED light on the 'Controller' become study ON. Then aim your TV or DVD Remote Control at 'Controller' and press corresponding button, for this case 'on/off' button. If thislearning process is successful, LED light on the 'Controller' is flashing again and ready for next button learning, othrewise LED light remain steady. That is the case, youneed to press Remote Control button again untill LED is flashing. Sometime button does not transmit signal, especially Remote Control is quite old.At this stage, LED is fleshing, you can quit 'LEARNING MODE' by pressing 'QUIT LEARNING' in the Menu or continue learning process by repeating above procedure. ";
    }
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
