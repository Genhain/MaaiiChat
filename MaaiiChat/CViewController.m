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
#import "CUIChatCellTableViewCell.h"
#import "CChatTableViewDelegate.h"
#import "FileIOManager.h"
#import "CChatLog.h"

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
    _chatScrollViewEventHandler = [CChatTableViewEventHandler Create:_chatTableView];
    _chatTableViewDelegate = [CChatTableViewDelegate Create:_chatTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
