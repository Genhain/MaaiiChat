//
//  CMessageInfo.m
//  MaaiiChat
//
//  Created by Ben on 03/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import "CMessageInfo.h"

NSString *const kdirection = @"direction";
NSString *const kname = @"name";
NSString *const kmessage = @"message";

@implementation CMessageInfo

- (void) encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeInteger:_direction forKey:kdirection];
    [encoder encodeObject:_name forKey:kname];
    [encoder encodeObject:_message forKey:kmessage];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    //no need to retain explicitly as using self.x calls retain implcitly via the @property
    if( (self = [super init]) )
    {
        _direction = [decoder decodeIntegerForKey:kdirection];
        _name = [decoder decodeObjectForKey:kname];
        _message = [decoder decodeObjectForKey:kmessage];
    }
    return self;
}

@end
