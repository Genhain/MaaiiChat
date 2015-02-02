//
//  CChatLog.h
//  MaaiiChat
//
//  Created by Ben on 02/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CMessageInfo;

@interface CChatLog : NSObject <NSCoding>

//array of messageinfo
@property (strong, nonatomic)NSMutableArray *log;

@end
