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
                   @"message":@"Hey, hows shit going?"
                   },
               @{
                   @"direction":@1,
                   @"name":@"me",
                   @"message":@"Nothing Much. Just Writing a really long winded sentence to test the functionality of the message height."
                   }].mutableCopy;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _testDataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CUIChatCellTableViewCell *cell = [_chatTableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    NSDictionary *messageData = _testDataArray[indexPath.row];
    [cell.nameLabel setText:messageData[@"name"]];
    [cell.messageLabel setText:messageData[@"message"]];
    
    [[cell nameLabel]sizeToFit];
    [[cell messageLabel]sizeToFit];
    
    UIImage *image;
    if([messageData[@"direction"] boolValue])
    {
        image= [[UIImage imageNamed:@"bubble_right"]resizableImageWithCapInsets:UIEdgeInsetsMake(18, 10, 6, 6) resizingMode:UIImageResizingModeStretch];
    }
    else
    {
        image= [[UIImage imageNamed:@"bubble_left"]resizableImageWithCapInsets:UIEdgeInsetsMake(18, 6, 6, 10) resizingMode:UIImageResizingModeStretch];
    }
    
    [[cell bubbleImage]setImage:image];
    
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if(!_customCell)
//        _customCell = [_chatTableView dequeueReusableCellWithIdentifier:@"CustomCell"];
//    
//    //configure cell
//    NSDictionary *messageData = _array[indexPath.row];
//    [_customCell.nameLabel setText:messageData[@"name"]];
//    [_customCell.messageLabel setText:messageData[@"message"]];
//    
//    
//    [[_customCell nameLabel]sizeToFit];
//    [[_customCell messageLabel]sizeToFit];
//    
//    //Layout cell
//    [_customCell layoutIfNeeded];
//    
//    //Get height of the cell
//    CGFloat height = [_customCell.messageLabel frame].size.height;
//    
//    return 300;
//}

@end
