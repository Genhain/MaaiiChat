//
//  CUIBubbleMessage.h
//  MaaiiChat
//
//  Created by Ben on 01/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CUIBubbleMessage : UIView

@property (weak,    nonatomic) NSCoder* coder;

@property (weak,   nonatomic) IBOutlet UIImageView *bubbleImage;
@property (weak,   nonatomic) IBOutlet UILabel *bubbleLabel;

- (void) setupForString:(NSString*)string;

@end
