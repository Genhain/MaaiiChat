//
//  CChatTableViewDelegate.m
//  MaaiiChat
//
//  Created by Ben on 02/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import "CChatTableViewDelegate.h"
#import "CUITableViewChatCell.h"
#import "CChatLogParser.h"
#import "CChatLog.h"
#import "UITableView+IndexPathFunctions.h"
#import "CUIChatTableView.h"
#import "FileIOManager.h"
#import "CMessageInfo.h"

NSString *const chatLogID = @"0_maaiiChat";

@interface CChatTableViewDelegate ()
{
    NSMutableArray *_testDataArray;
    CUITableViewChatCell *_customCell;
}

@end

@implementation CChatTableViewDelegate

+(instancetype)Create:(CUIChatTableView*)table
{
    return [[self alloc]initWithSource:table];
}

- (instancetype)initWithSource:(CUIChatTableView*)table
{
    self = [super init];
    if (self)
    {
        table.dataSource = self;
        table.delegate = self;
        
        _testDataArray = [[[CChatLogParser alloc]init] logForFileName:chatLogID].log;
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _testDataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CUITableViewChatCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell" forIndexPath:indexPath];
    
    CMessageInfo *messageData = _testDataArray[indexPath.row];
    
    [cell setCell:messageData];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _customCell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    
    //configure cell
    CMessageInfo *messageData = _testDataArray[indexPath.row];
    
    [_customCell setCell:messageData];
    
    //Get height of the cell
    CGFloat height = [_customCell.messageLabel frame].size.height+[_customCell.nameLabel frame].size.height+20;
    
    return height;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [(CUITableViewChatCell*)cell aboutToDisplay];
}

- (void)tableView:(UITableView *)tableView parseChatMessage:(CMessageInfo *)messageInfo
{
    [self addMessage:messageInfo];
    //Reload table and then scroll to bottom.
    [tableView reloadData];
    [tableView scrollToRowAtIndexPath:[tableView indexPathForLastRow] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    //randomise last message direction
    CMessageInfo* msg = [_testDataArray lastObject];
    msg.direction = arc4random() % 2;
    
    [FileIOManager Save:_testDataArray fileName:chatLogID];
}

- (void)addMessage:(CMessageInfo *)messageInfo
{
    [_testDataArray addObject:messageInfo];
}

@end
