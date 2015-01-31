//
//  CChatScrollViewDelegate.m
//  MaaiiChat
//
//  Created by Ben on 31/01/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import "CChatScrollViewDelegate.h"

@implementation CChatScrollViewDelegate
{
    
}

+(id)Create:(UIScrollView*)scrollView
{
    return [[CChatScrollViewDelegate alloc]init:scrollView];
}

- (instancetype)init:(UIScrollView*)scrollView
{
    self = [super init];
    if (self)
    {
        _scrollView = scrollView;
        scrollView.delegate = self;
        
        SEL selector = NSSelectorFromString(@"keyboardWillShow:");
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:selector
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
        
        [_scrollView setContentSize:CGSizeMake(0, _scrollView.bounds.size.height)];
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
    CGRect updatedRect = [_scrollView frame];
    
    updatedRect.size.height -= rect.size.height;
    
    CGPoint bottomOffset = CGPointMake(0, _scrollView.contentSize.height - updatedRect.size.height);
    [_scrollView setContentOffset:bottomOffset animated:YES];
    
    [UIView animateWithDuration:0.5f animations:^
     {
         [_scrollView setFrame:updatedRect];
     } ];
}

@end
