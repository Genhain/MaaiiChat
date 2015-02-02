//
//  CUIChatTableView.m
//  MaaiiChat
//
//  Created by Ben on 03/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import "CUIChatTableView.h"
#import "UITableViewChatMessageDelegate.h"
#import "CMessageInfo.h"

@implementation CUIChatTableView

- (void)addMessage:(CMessageInfo*)messageInfo
{
    [(id<UITableViewChatMessageDelegate>)self.delegate tableView:self parseChatMessage:messageInfo];
}

@end
