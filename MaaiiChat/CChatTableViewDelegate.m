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

@interface CChatTableViewDelegate ()
{
    NSMutableArray *_testDataArray;
    CUITableViewChatCell *_customCell;
    NSString *_currentChatLogID;
}

@end

@implementation CChatTableViewDelegate

+(instancetype)Create:(CUIChatTableView*)table chatLogID:(NSString*)fileName
{
    return [[self alloc]initWithSource:table chatLogID:fileName];
}

- (instancetype)initWithSource:(CUIChatTableView*)table chatLogID:(NSString*)fileName
{
    self = [super init];
    if (self)
    {
        _currentChatLogID = fileName;
        
        table.dataSource = self;
        table.delegate = self;
        
//        // this is here just to setup a showcase
//        CMessageInfo *one,*two,*three;
//        
//        one = [[CMessageInfo alloc]init];
//        one.direction = Them;
//        one.name = @"Them";
//        one.message = @"Hey, What are you up to?";
//        
//        two = [[CMessageInfo alloc]init];
//        two.direction = Me;
//        two.name = @"Me";
//        two.message = @"Nothing much, Just working on some code while attempting to adhere to the SOLID coding principles while also leveraging TDD.";
//        
//        three = [[CMessageInfo alloc]init];
//        three.direction = Them;
//        three.name = @"Them";
//        three.message = @"...Nerd";
//        
//        _testDataArray = @[one,two,three].mutableCopy;
//        
//        [FileIOManager Save:_testDataArray fileName:fileName];
        
        _testDataArray = [[[CChatLogParser alloc]init] logForFileName:fileName].log;
        if(_testDataArray == nil)
            _testDataArray = [NSMutableArray array];
        
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
    [tableView scrollRectToVisible:[tableView rectForBottomRow] animated:YES];
    
    //randomise last message direction
    CMessageInfo* msg = [_testDataArray lastObject];
    msg.direction = arc4random() % 2;
    
    [FileIOManager Save:_testDataArray fileName:_currentChatLogID];
}

- (void)addMessage:(CMessageInfo *)messageInfo
{
    [_testDataArray addObject:messageInfo];
}

- (void)clearChat
{
    [_testDataArray removeAllObjects];
    [FileIOManager Save:_testDataArray fileName:_currentChatLogID];
}

@end
