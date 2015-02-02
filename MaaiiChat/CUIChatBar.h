//
//  CUIChatBar.h
//  MaaiiChat
//
//  Created by Ben on 01/02/2015.
//  Copyright (c) 2015 Ben. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableViewChatMessageDelegate.h"

@interface CUIChatBar : UIView

@property (strong, nonatomic) NSString *message;

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak ,nonatomic) IBOutlet UIButton *sendButton;

- (void)sendMessage:(UITableView*)tableView;

@end
