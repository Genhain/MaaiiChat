//
//  CUIChatCellTableViewCell.m
//  MaaiiChat
//
//  Created by Ben on 01/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import "CUIChatCellTableViewCell.h"

@implementation CUIChatCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCell:(NSDictionary*)messageData
{
    [_nameLabel setText:messageData[@"name"]];
    [_messageLabel setText:messageData[@"message"]];
    
    [_nameLabel sizeToFit];
    [_messageLabel sizeToFit];
    
    UIImage *image;
    if([messageData[@"direction"] boolValue])
    {
        image= [[UIImage imageNamed:@"bubble_left"]resizableImageWithCapInsets:UIEdgeInsetsMake(18, 6, 6, 10) resizingMode:UIImageResizingModeStretch];
    }
    else
    {
        image= [[UIImage imageNamed:@"bubble_right"]resizableImageWithCapInsets:UIEdgeInsetsMake(18, 10, 6, 6) resizingMode:UIImageResizingModeStretch];
    }
    
    [_bubbleImage setImage:image];
    [_bubbleImage setFrame:CGRectMake(_nameLabel.frame.origin.x, 0, _messageLabel.frame.size.width+15, _messageLabel.frame.size.height + _nameLabel.frame.size.height + 15)];
}


@end
