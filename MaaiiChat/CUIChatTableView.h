//
//  CUIChatTableView.h
//  MaaiiChat
//
//  Created by Ben on 03/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CMessageInfo;

@interface CUIChatTableView : UITableView

- (void)addMessage:(CMessageInfo*)messageInfo;

@end
