//
//  CChatScrollViewDelegate.h
//  MaaiiChat
//
//  Created by Ben on 31/01/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CUIChatTableView;

@interface CChatTableViewEventHandler : NSObject
{
    
}

@property (strong, nonatomic) NSDictionary *notificationInfo;
@property (weak, nonatomic) CUIChatTableView *tableView;

+(id)Create:(CUIChatTableView*)tableView;

@end
