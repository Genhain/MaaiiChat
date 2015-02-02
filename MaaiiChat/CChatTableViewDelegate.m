//
//  CChatTableViewDelegate.m
//  MaaiiChat
//
//  Created by Ben on 02/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import "CChatTableViewDelegate.h"
#import "CUIChatCellTableViewCell.h"

@interface CChatTableViewDelegate ()
{
    NSMutableArray *_testDataArray;
    CUIChatCellTableViewCell *_customCell;
}

@end

@implementation CChatTableViewDelegate

+(instancetype)Create:(UITableView*)table
{
    return [[self alloc]initWithSource:table];
}

- (instancetype)initWithSource:(UITableView*)table
{
    self = [super init];
    if (self)
    {
        table.dataSource = self;
        table.delegate = self;
        
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
    CUIChatCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell" forIndexPath:indexPath];
    
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
    [(CUIChatCellTableViewCell*)cell aboutToDisplay];
}

@end
