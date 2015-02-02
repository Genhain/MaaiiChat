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
    
    [_nameLabel sizeToFit];
    [_messageLabel sizeToFit];
    
    //make changes after size to fit, otherwise they will be negated
    
    //move the text labels to the right with
    if(messageData.direction == Me)
    {
        CGFloat rightBuffer = 15;
        
        [_nameLabel setFrame:CGRectOffset([_nameLabel frame],
                                          ([self frame].size.width - [_nameLabel frame].origin.x)-([_nameLabel frame].size.width +rightBuffer),
                                          0)];
        
        [_messageLabel setFrame:CGRectOffset([_messageLabel frame],
                                             ([self frame].size.width - [_messageLabel frame].origin.x)-([_messageLabel frame].size.width +rightBuffer),
                                             0)];
    }
    
    [_bubbleImage setImage:image];
}

- (void)aboutToDisplay
{
    CGFloat height = [_nameLabel frame].size.height+[_messageLabel frame].size.height+15;
    CGFloat width = MAX([_messageLabel frame].size.width + 20, [_nameLabel frame].size.width+20);
    CGFloat posx = [_messageLabel frame].origin.x - 10;
    
    [_bubbleImage setFrame:CGRectMake(posx, 0, width,height)];
}


@end
