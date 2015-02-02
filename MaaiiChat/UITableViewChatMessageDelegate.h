//
//  MessageParser.h
//  MaaiiChat
//
//  Created by Ben on 03/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CMessageInfo;

@protocol UITableViewChatMessageDelegate <NSObject>

- (void)tableView:(UITableView*) tableView parseChatMessage:(CMessageInfo*)messageInfo;

@end
