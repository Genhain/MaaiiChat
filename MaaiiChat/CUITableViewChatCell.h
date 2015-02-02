//
//  CUIChatCellTableViewCell.h
//  MaaiiChat
//
//  Created by Ben on 01/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CMessageInfo;

@interface CUITableViewChatCell : UITableViewCell 

@property (weak,    nonatomic) IBOutlet UILabel *nameLabel;
@property (weak,    nonatomic) IBOutlet UILabel *messageLabel;
@property (weak,    nonatomic) IBOutlet UIImageView *bubbleImage;

- (void)setCell:(CMessageInfo*)messageData;
- (void)aboutToDisplay;

@end
