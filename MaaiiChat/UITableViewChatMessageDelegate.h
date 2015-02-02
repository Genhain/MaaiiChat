//
//  MessageParser.h
//  MaaiiChat
//
//  Created by Ben on 03/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UITableViewChatMessageDelegate <NSObject>

- (void)tableView:(UITableView*) tableView parseChatMessage:(NSMutableDictionary*)messageInfo;

@end
