//
//  CChatTableViewDelegate.h
//  MaaiiChat
//
//  Created by Ben on 02/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableViewChatMessageDelegate.h"

@class CUIChatTableView;

@interface CChatTableViewDelegate : UITableViewCell <UITableViewDataSource,UITableViewDelegate,UITableViewChatMessageDelegate>

+(instancetype)Create:(CUIChatTableView*)table;

- (void)addMessage:(CMessageInfo*)messageInfo;

@end
