//
//  CViewController.h
//  MaaiiChat
//
//  Created by Ben on 30/01/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CChatBarEventHandler;
@class CChatTableViewEventHandler;
@class CUIChatBar;
@class CUITableViewChatCell;
@class CChatTableViewDelegate;
@class CUIChatTableView;

@interface CViewController : UIViewController


@property (strong, nonatomic) CChatBarEventHandler *chatBarEventHandler;
@property (strong, nonatomic) CChatTableViewEventHandler *chatTableViewEventHandler;
@property (strong, nonatomic) CChatTableViewDelegate *chatTableViewDelegate;

@property (weak, nonatomic) IBOutlet CUIChatBar *chatBar;
@property (weak, nonatomic) IBOutlet CUIChatTableView *chatTableView;
@property (weak, nonatomic) IBOutlet UITextField *chatTextField;

- (IBAction)sendMessage:(id)sender;
- (IBAction)clearChat:(id)sender;

@end
