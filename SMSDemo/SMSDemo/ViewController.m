//
//  ViewController.m
//  SMSDemo
//
//  Created by Andrew on 14-11-11.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ViewController.h"
#import <MessageUI/MessageUI.h>

@interface ViewController ()<MFMessageComposeViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self sendSMS:@"hello world" recipientList:@[@"18911422463"]];
	// Do any additional setup after loading the view, typically from a nib.
}




- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    [self dismissModalViewControllerAnimated:YES];
    
    if (result == MessageComposeResultCancelled)
        NSLog(@"Message cancelled");
        else if (result == MessageComposeResultSent){
            NSLog(@"Message sent");
        }else{
            NSLog(@"Message failed");
            }

}

- (void)sendSMS:(NSString *)bodyOfMessage recipientList:(NSArray *)recipients
{
    
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init] ;
    
    if([MFMessageComposeViewController canSendText])
        
    {
        
        controller.body = bodyOfMessage;
        
        controller.recipients = recipients;
        
        controller.messageComposeDelegate = self;
        
        [self presentModalViewController:controller animated:YES];
        
    }   
    
}

@end
