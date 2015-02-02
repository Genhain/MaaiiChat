//
//  CUIChatBar.m
//  MaaiiChat
//
//  Created by Ben on 01/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import "CUIChatBar.h"
#import "CUIChatTableView.h"

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
    [chatView addMessage:@{@"direction":@1,@"name":@"Me",@"message":_message}.mutableCopy];
}

@end
