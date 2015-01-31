//
//  CViewController.h
//  MaaiiChat
//
//  Created by Ben on 30/01/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CChatBarEventHandler;
@class CChatScrollViewDelegate;
@class CUIChatBar;

@interface CViewController : UIViewController 


@property (strong, nonatomic) CChatBarEventHandler *chatBarEventHandler;
@property (strong, nonatomic) CChatScrollViewDelegate *chatScrollViewDelegate;

@property (weak, nonatomic) IBOutlet CUIChatBar *chatBar;
@property (weak, nonatomic) IBOutlet UIScrollView *chatScrollView;
@property (weak, nonatomic) IBOutlet UITextField *chatTextField;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
