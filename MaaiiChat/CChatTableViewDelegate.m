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
        
        _testDataArray = [[[CChatLogParser alloc]init] logForFileName:@"0_maaiiChat"].log;
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
    
    NSDictionary *messageData = _testDataArray[indexPath.row];
    
    [cell setCell:messageData];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _customCell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    
    //configure cell
    NSDictionary *messageData = _testDataArray[indexPath.row];
    
    [_customCell setCell:messageData];
    
    //Get height of the cell
    CGFloat height = [_customCell.messageLabel frame].size.height+[_customCell.nameLabel frame].size.height+20;
    
    return height;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [(CUITableViewChatCell*)cell aboutToDisplay];
}

- (void)tableView:(UITableView *)tableView parseChatMessage:(NSMutableDictionary *)messageInfo
{
    [self addMessage:messageInfo];
    //Reload table and then scroll to bottom.
    [tableView reloadData];
    [tableView scrollToRowAtIndexPath:[tableView indexPathForLastRow] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

- (void)addMessage:(NSMutableDictionary *)messageInfo
{
    [_testDataArray addObject:messageInfo];
}

@end
