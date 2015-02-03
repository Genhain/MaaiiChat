//
//  CViewController.m
//  MaaiiChat
//
//  Created by Ben on 30/01/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import "CViewController.h"
#import "CChatBarEventHandler.h"
#import "CChatTableViewEventHandler.h"
#import "CUIBubbleMessage.h"
#import "UIView+NibLoading.h"
#import "CUITableViewChatCell.h"
#import "CChatTableViewDelegate.h"
#import "FileIOManager.h"
#import "CChatLog.h"
#import "CUIChatBar.h"
#import "UITableView+IndexPathFunctions.h"
#import "CUIChatTableView.h"

NSString *const chatLogID = @"0_maaiiChat";

@interface CViewController ()
{
    NSMutableArray *_testDataArray;
}

@end

@implementation CViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _chatBarEventHandler = [CChatBarEventHandler Create:_chatBar];
    _chatTableViewEventHandler = [CChatTableViewEventHandler Create:_chatTableView];
    _chatTableViewDelegate = [CChatTableViewDelegate Create:_chatTableView chatLogID:chatLogID];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendMessage:(id)sender
{
    [_chatBar sendMessage:_chatTableView];
}
- (IBAction)clearChat:(id)sender
{
    [_chatTableViewDelegate clearChat];
    [_chatTableView reloadData];
}

@end
