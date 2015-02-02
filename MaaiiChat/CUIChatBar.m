//
//  CUIChatBar.m
//  MaaiiChat
//
//  Created by Ben on 01/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import "CUIChatBar.h"
#import "CUIChatTableView.h"
#import "CMessageInfo.h"

@implementation CUIChatBar

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        _message = [NSString string];
    }
    return self;
}

- (void)sendMessage:(CUIChatTableView*)chatView
{
    _message = _textField.text;
    CMessageInfo *msg = [[CMessageInfo alloc] init];
    msg.direction = Me;
    msg.name = @"Me";
    msg.message = _message;
    
    [chatView addMessage:msg];
}

@end
