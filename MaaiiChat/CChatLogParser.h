//
//  CChatLogParser.h
//  MaaiiChat
//
//  Created by Ben on 02/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CChatLog;

@interface CChatLogParser : NSObject

- (CChatLog*)logForFileName:(NSString*)fileName;

@end
