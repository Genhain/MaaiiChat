//
//  CChatLog.m
//  MaaiiChat
//
//  Created by Ben on 02/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import "CChatLog.h"

NSString *const kchatLog = @"createdGames";

@implementation CChatLog

- (void) encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:_log forKey:kchatLog];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    //no need to retain explicitly as using self.x calls retain implcitly via the @property
    if( (self = [super init]) )
    {
        _log = [decoder decodeObjectForKey:kchatLog];
    }
    return self;
}


@end
