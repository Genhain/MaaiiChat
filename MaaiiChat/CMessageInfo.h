//
//  CMessageInfo.h
//  MaaiiChat
//
//  Created by Ben on 03/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum kDirection : NSInteger
{
    Me,
    Them
} kDirection;

@interface CMessageInfo : NSObject <NSCoding>

@property (readwrite, nonatomic)kDirection direction;
@property (strong, nonatomic)NSString *name;
@property (strong, nonatomic)NSString *message;

@end
