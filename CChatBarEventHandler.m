//
//  CChatTextFieldDelegate.m
//  MaaiiChat
//
//  Created by Ben on 31/01/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import "CChatBarEventHandler.h"
#import "CViewController.h"
#import "CUIChatBar.h"

@interface CChatBarEventHandler ()
{
    BOOL _KeyboardHidden;
}

@end


@implementation CChatBarEventHandler

+(instancetype)Create:(CUIChatBar*)chatBar
{
    return [[self alloc]initWithSource:chatBar];
}

- (instancetype)initWithSource:(CUIChatBar*)chatBar
{
    self = [super init];
    if (self)
    {
        _KeyboardHidden = YES;
        
        _chatBar = chatBar;
        [_chatBar textField].delegate = self;
        
        SEL selector = NSSelectorFromString(@"keyboardWillShow:");
                
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:selector
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)notification
{
    // Get the size of the keyboard.
    _notificationInfo = [notification userInfo];
    
    CGRect rect = [[_notificationInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    [self updateTextFieldWithRect:rect];
    
    _KeyboardHidden = NO;
}

- (void)updateTextFieldWithRect:(CGRect)rect
{
    if(!_KeyboardHidden)return;
    
    CGRect updatedRect = CGRectOffset([_chatBar frame], 0, -rect.size.height);
    
    [UIView animateWithDuration:0.5f animations:^
     {
         [_chatBar setFrame:updatedRect];
     } ];
}

@end
