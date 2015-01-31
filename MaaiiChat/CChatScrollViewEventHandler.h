//
//  CChatScrollViewDelegate.h
//  MaaiiChat
//
//  Created by Ben on 31/01/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CChatScrollViewEventHandler : NSObject <UIScrollViewDelegate>
{
    
}

@property (strong, nonatomic) NSDictionary *notificationInfo;
@property (weak, nonatomic) UIScrollView *scrollView;

+(id)Create:(UIScrollView*)scrollView;

@end
