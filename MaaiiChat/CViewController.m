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

@interface CViewController ()
{
    NSMutableArray *_array;
    NSMutableDictionary *_messageData;
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
    
    _array = @[@{
                   @"name":@"them",
                   @"message":@"Hey, hows shit going?"
                   },
               @{
                   @"name":@"me",
                   @"message":@"Nothing Much."
                   }].mutableCopy;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CUIChatCellTableViewCell *cell = [_chatTableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    NSDictionary *messageData = _array[indexPath.row];
    [cell.nameLabel setText:messageData[@"name"]];
    [cell.messageLabel setText:messageData[@"message"]];
    
    return cell;
}

@end
