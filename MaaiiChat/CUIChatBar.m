//
//  CUIChatBar.m
//  MaaiiChat
//
//  Created by Ben on 01/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import "CUIChatBar.h"

@implementation CUIChatBar

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        _message = [NSString string];
    }
    return self;
}

@end
