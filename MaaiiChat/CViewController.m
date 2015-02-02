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

#define FONT_SIZE 14.0f
#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f

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
    
    _chatTableView.delegate = self;
    _chatTableView.dataSource = self;
    
    _testDataArray = @[@{
                   @"direction":@0,
                   @"name":@"them",
                   @"message":@"Hey, how's it going?"
                   },
               @{
                   @"direction":@1,
                   @"name":@"me",
                   @"message":@"Nothing Much. Just Writing a really long winded sentence to test the functionality of the message height within the cell, so far it seems to be going okay. TDD helped quite a bit here"
                   },
               @{
                   @"direction":@0,
                   @"name":@"them",
                   @"message":@"...Nerd"
                   },
                       @{
                           @"direction":@0,
                           @"name":@"them",
                           @"message":@"...Nerd"
                           },
                       @{
                           @"direction":@0,
                           @"name":@"them",
                           @"message":@"...Nerd"
                           },
                       @{
                           @"direction":@0,
                           @"name":@"them",
                           @"message":@"...Nerd"
                           },
                       @{
                           @"direction":@0,
                           @"name":@"them",
                           @"message":@"...Nerd"
                           },
                       @{
                           @"direction":@0,
                           @"name":@"them",
                           @"message":@"...Nerd"
                           },
                       @{
                           @"direction":@0,
                           @"name":@"them",
                           @"message":@"...Nerd"
                           }].mutableCopy;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Move to a delegate class
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _testDataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CUIChatCellTableViewCell *cell = [_chatTableView dequeueReusableCellWithIdentifier:@"CustomCell" forIndexPath:indexPath];
    
    NSDictionary *messageData = _testDataArray[indexPath.row];
    
    [cell setCell:messageData];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _customCell = [_chatTableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    
    //configure cell
    NSDictionary *messageData = _testDataArray[indexPath.row];
   
    [_customCell setCell:messageData];
    
    //Get height of the cell
    CGFloat height = [_customCell.messageLabel frame].size.height+[_customCell.nameLabel frame].size.height+20;
    
    return height;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [(CUIChatCellTableViewCell*)cell aboutToDisplay];
}

@end
