//
//  CUIBubbleMessage.m
//  MaaiiChat
//
//  Created by Ben on 01/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import "CUIBubbleMessage.h"
#import "UIView+NibLoading.h"

@implementation CUIBubbleMessage


- (void) setupForString:(NSString*)string;
{
    [[self bubbleLabel]setText:string];
    [[self bubbleLabel] sizeToFit];
    UIImage *image = [[[self bubbleImage]image]resizableImageWithCapInsets:UIEdgeInsetsMake(18, 6, 6, 10)];
    [[self bubbleImage]setImage:image];
    
    [[self bubbleImage]setFrame:CGRectMake(0, 0, [self bubbleLabel].frame.size.width+13, [self bubbleLabel].frame.size.height+10)];
    
    [[self bubbleLabel] setFrame:CGRectOffset([[self bubbleLabel] frame], 5, 5)];
    
}

@end
