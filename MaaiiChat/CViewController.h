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

@interface CViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) CChatBarEventHandler *chatBarEventHandler;
@property (strong, nonatomic) CChatTableViewEventHandler *chatScrollViewEventHandler;

@property (weak, nonatomic) IBOutlet CUIChatBar *chatBar;
@property (weak, nonatomic) IBOutlet UITableView *chatTableView;
@property (weak, nonatomic) IBOutlet UITextField *chatTextField;

@end
