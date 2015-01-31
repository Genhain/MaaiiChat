//
//  CChatTextFieldDelegate.h
//  MaaiiChat
//
//  Created by Ben on 31/01/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CViewController;
@class CUIChatBar;

@interface CChatBarEventHandler : NSObject <UITextFieldDelegate>

@property (weak, nonatomic) CUIChatBar *chatBar;
@property (strong, nonatomic) NSDictionary *notificationInfo;

+(instancetype)Create:(CUIChatBar*)chatBar;

@end
