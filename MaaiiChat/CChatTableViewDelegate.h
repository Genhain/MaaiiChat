//
//  CChatTableViewDelegate.h
//  MaaiiChat
//
//  Created by Ben on 02/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableViewChatMessageDelegate.h"

@interface CChatTableViewDelegate : UITableViewCell <UITableViewDataSource,UITableViewDelegate,UITableViewChatMessageDelegate>

+(instancetype)Create:(UITableView*)table;

- (void)addMessage:(NSMutableDictionary*)messageInfo;

@end
