//
//  CChatScrollViewDelegate.m
//  MaaiiChat
//
//  Created by Ben on 31/01/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import "CChatTableViewEventHandler.h"
#import "CUIChatTableView.h"

@implementation CChatTableViewEventHandler
{
    
}

+(id)Create:(CUIChatTableView*)tableView
{
    return [[CChatTableViewEventHandler alloc]init:tableView];
}

- (instancetype)init:(CUIChatTableView*)scrollView
{
    self = [super init];
    if (self)
    {
        _tableView = scrollView;
        
        SEL selector = NSSelectorFromString(@"keyboardWillShow:");
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:selector
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
        
        [_tableView setContentSize:CGSizeMake(0, _tableView.bounds.size.height)];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification*)notification
{
    _notificationInfo = [notification userInfo];
    
    CGRect rect = [[_notificationInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    [self updateScrollView:rect];
}

-(void)updateScrollView:(CGRect)rect
{
    CGRect updatedRect = [_tableView frame];
    
    updatedRect.size.height -= rect.size.height;
    
    CGPoint bottomOffset = CGPointMake(0, _tableView.contentSize.height - updatedRect.size.height);
    [_tableView setContentOffset:bottomOffset animated:YES];
    
    [UIView animateWithDuration:0.5f animations:^
     {
         [_tableView setFrame:updatedRect];
     } ];
}

@end
