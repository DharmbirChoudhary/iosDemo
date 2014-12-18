//
//  ViewController.m
//  KeyboardDemo
//
//  Created by Andrew on 14-10-28.
//  Copyright (c) 2014年 Andrew. All rights reserved.
//

#import "ViewController.h"
#import "DaiDodgeKeyboard.h"

@implementation UIView (FindFirstResponder)

-(UIView*) findFirstResponder {
    
    if (self.isFirstResponder) return self;
    for (UIView *subView in self.subviews) {
        UIView *firstResponder = [subView findFirstResponder];
        if (firstResponder != nil) return firstResponder;
    }
    return nil;
    
}

@end
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    UITextField *tField=[[UITextField alloc]initWithFrame:CGRectMake(10, 10, 200, 50)];
    tField.backgroundColor=[UIColor redColor];
    [self.view addSubview:tField];
    
    
    UIToolbar *toolBar = [self createToolbar];
    
    for (UIView *v in self.view.subviews) {
        if ([v respondsToSelector:@selector(setText:)]) {
            [v performSelector:@selector(setDelegate:) withObject:self];
            [v performSelector:@selector(setInputAccessoryView:) withObject:toolBar];
        }
    }
    
       [DaiDodgeKeyboard addRegisterTheViewNeedDodgeKeyboard:self.view];
}

-(BOOL) textFieldShouldReturn : (UITextField*) textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - private

-(UIToolbar*) createToolbar {
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Next"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(nextTextField)];
    
    UIBarButtonItem *prevButton = [[UIBarButtonItem alloc] initWithTitle:@"Prev"
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(prevTextField)];
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(textFieldDone)];
        toolBar.items = @[prevButton, nextButton, space, done];
    
    return toolBar;
    
}

-(void) textFieldDone {
    
    [[self.view findFirstResponder] resignFirstResponder];
    
}

@end
