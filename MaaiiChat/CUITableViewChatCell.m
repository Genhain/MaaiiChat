//
//  CUIChatCellTableViewCell.m
//  MaaiiChat
//
//  Created by Ben on 01/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import "CUITableViewChatCell.h"
#import "CMessageInfo.h"

@interface CUITableViewChatCell ()
{
    UILabel *_initialNameLabel;
    UILabel *_initalMessageLabel;
}

@end

@implementation CUITableViewChatCell

- (void)awakeFromNib
{
    _initialNameLabel = [[UILabel alloc]initWithFrame:_nameLabel.frame];
    _initalMessageLabel = [[UILabel alloc]initWithFrame:_messageLabel.frame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCell:(CMessageInfo*)messageData
{
    //Reset the reused cell 
    [_nameLabel setFrame:_initialNameLabel.frame];
    [_messageLabel setFrame:_initalMessageLabel.frame];
    
    [_nameLabel setText:messageData.name];
    [_messageLabel setText:messageData.message];
    
    [_nameLabel sizeToFit];
    [_messageLabel sizeToFit];
    
    UIImage *image;
    //because the message is saved at random the name label has also have to be set based on the direction.
    if(messageData.direction == Me)
    {
        [_nameLabel setText:@"Me"];
        image= [[UIImage imageNamed:@"bubble_left"]resizableImageWithCapInsets:UIEdgeInsetsMake(18, 6, 6, 10) resizingMode:UIImageResizingModeStretch];
    }
    else
    {
        [_nameLabel setText:@"Them"];
        image= [[UIImage imageNamed:@"bubble_right"]resizableImageWithCapInsets:UIEdgeInsetsMake(18, 10, 6, 6) resizingMode:UIImageResizingModeStretch];
    }
    
    [_bubbleImage setImage:image];

}

- (void)aboutToDisplay
{
    [_bubbleImage setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}


@end
