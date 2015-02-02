//
//  CChatLogParser.m
//  MaaiiChat
//
//  Created by Ben on 02/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import "CChatLogParser.h"
#import "CChatLog.h"
#import "FileIOManager.h"

@interface CChatLogParser ()
{
    CChatLog *_chatLog;
}

@end

@implementation CChatLogParser

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _chatLog = [[CChatLog alloc]init];
    }
    return self;
}

- (CChatLog*)logForFileName:(NSString*)fileName
{
    _chatLog = [FileIOManager LoadObjectForFileName:fileName];
    
    return _chatLog;
}

@end
